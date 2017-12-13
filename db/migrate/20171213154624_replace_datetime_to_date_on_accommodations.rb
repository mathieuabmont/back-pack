class ReplaceDatetimeToDateOnAccommodations < ActiveRecord::Migration[5.1]
  def change
    add_column :accommodations, :tmp_departure_date, :date
    add_column :accommodations, :tmp_arrival_date, :date
    Accommodation.find_each do |accommodation|
      accommodation.update(tmp_departure_date: accommodation.departure_date.to_date, tmp_arrival_date: accommodation.arrival_date.to_date)
    end
    remove_column :accommodations, :departure_date
    remove_column :accommodations, :arrival_date

    rename_column :accommodations, :tmp_departure_date, :departure_date
    rename_column :accommodations, :tmp_arrival_date, :arrival_date
  end
end
