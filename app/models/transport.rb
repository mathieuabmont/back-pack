class Transport < ApplicationRecord
  belongs_to :step
  has_one :ticket
end
