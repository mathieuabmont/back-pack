class Trip < ApplicationRecord
  validates :title, presence: true
  has_many :steps, dependent: :destroy
  has_many :itineraries, dependent: :destroy
  has_many :users, through: :itineraries
end
