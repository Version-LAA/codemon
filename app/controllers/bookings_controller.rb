class BookingsController < ApplicationController
  before_action :set_pokemon, only: %i[new create]

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.pokemon = @pokemon
    @booking.user = current_user
    @booking.booking_status = "pending"
    authorize @booking #we authorize the ability to create a pokemon booking
    if @booking.end_date && @booking.start_date #need clarity on this line
      @booking_price = (@booking.end_date - @booking.start_date).to_f * @booking.pokemon.price.to_f
    else
      @booking_price = 0
    end
    if @booking.save
      redirect_to root_path
    else
      redirect_to bed_path(@pokemon)
    end
    raise
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :booking_status)
  end

  def set_pokemon
    @pokemon = Pokemon.find(params[:pokemon_id])
  end
end
