class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  def home
    @pokemons = Pokemon.all
    #@pokemons = Pokemon.all
    #@pokemons = Pokemon.where("status !=?" nil)
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end

  def my_bookings
    @my_bookings = Booking.where("user_id=?", params[:user_id])
  end
end
