class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  def home
    @pokemons = Pokemon.all
    if params[:query].present?
      @pokemons = @pokemons.search_by_name_and_type(params[:query])
    end
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end
end
