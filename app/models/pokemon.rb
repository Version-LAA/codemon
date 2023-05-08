class Pokemon < ApplicationRecord
  belongs_to :user
  # to impact how the pokemon class will behave
  has_many :bookings
  has_one_attached :photo
  validates :name,:pokemon_type,:rarity,:price,:description, :size, presence: true
  RARITY = ['common', 'uncommon', 'rare']
  include PgSearch::Model
  pg_search_scope :search_by_name_and_type,
    against: [ :name, :pokemon_type],
    using: {
      tsearch: { prefix: true }
    }
end
