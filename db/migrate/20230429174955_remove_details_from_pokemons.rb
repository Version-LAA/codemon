class RemoveDetailsFromPokemons < ActiveRecord::Migration[7.0]
  def change
    remove_column :pokemons, :evolution, :integer
    remove_column :pokemons, :abilities, :text
    remove_column :pokemons, :image_url, :text
    remove_column :pokemons, :catchability, :text
    remove_column :pokemons, :date_availability, :date
  end
end
