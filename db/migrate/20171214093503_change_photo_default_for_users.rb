class ChangePhotoDefaultForUsers < ActiveRecord::Migration[5.1]
  def change
    change_column_default :users, :photo, from: "http://res.cloudinary.com/alumni/image/upload/v1513179673/blank-profile-picture-973460_640_y863w7.png", to: nil
  end
end
