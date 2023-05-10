class BookingsController < ApplicationController
  before_action :set_pokemon, only: %i[new create]
  before_action :set_booking, only: %i[edit update cancel_booking]

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.pokemon = @pokemon
    @booking.user = current_user
    @booking.booking_status = "pending"
    @pokemon.status = "pending"
    @pokemon.save
    authorize @booking #we authorize the ability to create a pokemon booking
    if @booking.end_date && @booking.start_date #need clarity on this line
      @booking.total = (@booking.end_date - @booking.start_date).to_f * @booking.pokemon.price.to_f
    else
      @booking.total = 0
    end
    if @booking.save
      redirect_to my_bookings_path
    else
      redirect_to booking_path(@pokemon)
    end
  end

  def edit
    @booking.user = current_user
  end

  def update
    @booking.user = current_user
    @booking.update(booking_params)
    if @booking.save
      redirect_to my_bookings_path
    else
      redirect_to booking_path(@booking)
    end
  end

  def cancel_booking
    @booking.booking_status = "cancel"
    @booking.save
    redirect_to my_bookings_path
  end

  def my_bookings
    @bookings = current_user.bookings
    @bookings = policy_scope(@bookings)
    @booking_request = Booking.where("user_id != #{current_user.id}")

  end

  # to approve or deny a booking
  def update_booking_status
    @booking_request = Booking.where("user_id != #{current_user.id}")
    @my_request = @booking_request.find(params[:booking_id])
    authorize @my_request
    if params[:booking_update] == "approve"
      @status = "true"
      @my_request.booking_status = "approved"
      @my_request.save
      redirect_back(fallback_location: root_path)
    elsif params[:booking_update] == "reject"
      @status = "false"
      @my_request.booking_status = "rejected"
      @my_request.save
      redirect_back(fallback_location: root_path)
    end

    #@booking = Booking.find(params[:id])


  end


  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :booking_status)
  end

  def set_pokemon
    @pokemon = Pokemon.find(params[:pokemon_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end
end
