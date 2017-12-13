class ChangePhotoForUsers < ActiveRecord::Migration[5.1]
  def change
    change_column_default :users, :photo, from: nil, to: "http://res.cloudinary.com/alumni/image/upload/v1513179673/blank-profile-picture-973460_640_y863w7.png"
  end
end
