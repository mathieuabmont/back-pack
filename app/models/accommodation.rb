class Accommodation < ApplicationRecord
  belongs_to :step

  validates :departure_date, presence: true
  validates :arrival_date, presence: true
end
