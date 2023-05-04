class AddStatusToPokemons < ActiveRecord::Migration[7.0]
  def change
    add_column :pokemons, :status, :string
  end
end
