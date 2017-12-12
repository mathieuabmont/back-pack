class Invitation < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :trip
end
