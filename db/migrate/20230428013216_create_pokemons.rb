class CreatePokemons < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :type
      t.integer :rarity
      t.text :image_url
      t.text :description
      t.text :abilities
      t.integer :evolution
      t.integer :size
      t.text :catchability
      t.decimal :price
      t.date :date_availability
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
