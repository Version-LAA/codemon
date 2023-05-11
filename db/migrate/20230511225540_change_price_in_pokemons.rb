class ChangePriceInPokemons < ActiveRecord::Migration[7.0]
  def change
    change_column :pokemons, :price, :integer
  end
end
