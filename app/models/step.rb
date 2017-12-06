class Step < ApplicationRecord
  belongs_to :trip
  has_one :transport
  has_many :activities
  has_one :accommodation
  validates :title, presence: true
end
