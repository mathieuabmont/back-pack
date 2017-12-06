class AddAllColumnsToAccommodations < ActiveRecord::Migration[5.1]
  def change
    add_column :accommodations, :category, :string
    add_column :accommodations, :name, :string
    add_column :accommodations, :url, :string
    add_column :accommodations, :location, :string
    add_column :accommodations, :arrival_date, :datetime
    add_column :accommodations, :departure_date, :datetime
  end
end
