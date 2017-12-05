class Step < ApplicationRecord
  belongs_to :trip
  has_many :transports
  has_many :activities
  validates :title, presence: true
end
