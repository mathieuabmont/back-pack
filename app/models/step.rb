class Step < ApplicationRecord
  belongs_to :trip
  has_many :transports
  validates :title, presence: true
end
