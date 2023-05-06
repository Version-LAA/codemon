class PokemonsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :show,:index ]
  before_action :find_pokemon, only: [:show, :destroy, :edit, :update]

  def index
    @pokemons = policy_scope(Pokemon)
  end

  def show
    @pokemon = Pokemon.find(params[:id])
    authorize(@pokemon)
  end

  def destroy
    @pokemon.destroy
    raise
    redirect_to pokemons_path, status: :see_other
  end

  private

  def find_pokemon
    @pokemon = Pokemon.find(params[:id])
  end
end
