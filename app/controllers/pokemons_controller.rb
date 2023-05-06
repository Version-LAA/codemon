class PokemonsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :show,:index ]
  before_action :find_pokemon, only: [:show, :destroy, :edit, :update,:edit]

  def index
    @pokemons = policy_scope(Pokemon)
  end

  def new
    @pokemon = Pokemon.new
    authorize @pokemon
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    @pokemon.user_id = current_user.id
    authorize(@pokemon)
    get_image(@pokemon)
    @pokemon.save
    redirect_to root_path
  end

  def show
    @pokemon = Pokemon.find(params[:id])
    authorize(@pokemon)
  end

  def destroy
    authorize(@pokemon)
    @pokemon.destroy
    redirect_to pokemons_path, status: :see_other
  end

  def edit
  end

  def update
  end

  private

  def find_pokemon
    @pokemon = Pokemon.find(params[:id])
  end

  def pokemon_params
    params.require(:pokemon).permit(:name, :pokemon_type,:rarity, :description, :size, :price)
  end

  def get_image(pokemon)
    url = "https://pokeapi.co/api/v2/pokemon/#{pokemon.name}/"
    request = URI.open(url).read
    pokemon_api = JSON.parse(request)
    image = pokemon_api['sprites']['other']['dream_world']['front_default']
    photo_file = URI.open(image)
    pokemon.photo.attach(io:photo_file,filename:"#{pokemon.name}.png",content_type:"image/png")
  end
end
