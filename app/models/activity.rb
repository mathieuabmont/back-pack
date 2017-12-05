class Activity < ApplicationRecord
  belongs_to :step
  validates :title, presence: true
end
