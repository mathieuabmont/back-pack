class AddDescriptionToAccommodation < ActiveRecord::Migration[5.1]
  def change
    add_column :accommodations, :description, :text
  end
end
