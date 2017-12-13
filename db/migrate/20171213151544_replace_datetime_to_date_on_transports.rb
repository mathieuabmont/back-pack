class ReplaceDatetimeToDateOnTransports < ActiveRecord::Migration[5.1]
  def change
    add_column :transports, :tmp_departure_date, :date
    add_column :transports, :tmp_arrival_date, :date
    Transport.find_each do |transport|
      transport.update(tmp_departure_date: transport.departure_date.to_date, tmp_arrival_date: transport.arrival_date.to_date)
    end
    remove_column :transports, :departure_date
    remove_column :transports, :arrival_date

    rename_column :transports, :tmp_departure_date, :departure_date
    rename_column :transports, :tmp_arrival_date, :arrival_date
  end
end
