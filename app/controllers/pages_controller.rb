class PagesController < ApplicationController
  def home
    @pokemons = Pokemon.all
  end
end
