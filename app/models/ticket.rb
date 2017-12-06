class Ticket < ApplicationRecord
  belongs_to :transport
  belongs_to :user
  mount_uploader :photo, PhotoUploader
end
