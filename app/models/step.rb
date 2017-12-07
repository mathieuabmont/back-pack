class Step < ApplicationRecord
  belongs_to :trip
  has_one :transport, dependent: :destroy
  has_many :activities, dependent: :destroy
  has_one :accommodation, dependent: :destroy
  validates :title, presence: true
end
