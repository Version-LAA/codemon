class Pokemon < ApplicationRecord
  belongs_to :user
  # to impact how the pokemon class will behave
  has_many :bookings
  has_one_attached :photo
end
