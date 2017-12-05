class Step < ApplicationRecord
  belongs_to :trip
  has_many :transports, :activities,
  validates :title, presence: true
end
