class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    authorize @booking
  end

  # def create
  #   @pokemon = Pokemon.find(params[:pokemon_id])
  #   @booking = Booking.new(booking_params)
  #   @booking.pokemon = @pokemon
  #   @booking.user = current_user

  # end

  # private

  # def booking_params
  #   params.require

  # def set_booking
  #   @booking = Booking.find(params[:id])
  # end

  # end
end
