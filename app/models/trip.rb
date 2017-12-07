class Trip < ApplicationRecord
  validates :title, presence: true
  has_many :steps, dependent: :destroy
  has_one :itinerary, dependent: :destroy
  has_many :users, through: :itinerary
end
