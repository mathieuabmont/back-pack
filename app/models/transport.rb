class Transport < ApplicationRecord
  belongs_to :step
  has_one :ticket, dependent: :destroy

  validates :departure_date, presence: true
  validates :arrival_date, presence: true
end
