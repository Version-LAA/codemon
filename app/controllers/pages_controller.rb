class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  def home
    @pokemons = Pokemon.all
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end

  def my_bookings
    @my_bookings = Booking.where("user_id=?", params[:user_id])
  end
end
