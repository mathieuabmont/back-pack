class Ticket < ApplicationRecord
  belongs_to :transport
  belongs_to :user
end
