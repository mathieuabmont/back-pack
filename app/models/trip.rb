class Trip < ApplicationRecord
  validates :title, presence: true
  has_many :steps
  has_one :itinerary
  has_many :users, through: :itinerary
end
