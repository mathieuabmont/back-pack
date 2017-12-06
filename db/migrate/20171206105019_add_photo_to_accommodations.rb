class AddPhotoToAccommodations < ActiveRecord::Migration[5.1]
  def change
    add_column :accommodations, :photo, :string
  end
end
