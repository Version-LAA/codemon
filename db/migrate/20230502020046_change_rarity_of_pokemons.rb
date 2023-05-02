class ChangeRarityOfPokemons < ActiveRecord::Migration[7.0]
  def change
    change_column :pokemons, :rarity, :string
  end
end
