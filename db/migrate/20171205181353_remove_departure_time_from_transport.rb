class RemoveDepartureTimeFromTransport < ActiveRecord::Migration[5.1]
  def change
    remove_column :transports, :departure_time, :datetime
  end
end
