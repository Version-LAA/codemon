class ChangeTypeColumnPokemon < ActiveRecord::Migration[7.0]
  def change
    rename_column :pokemons, :type, :pokemon_type
  end
end
