class AddDepartureTimeToTransport < ActiveRecord::Migration[5.1]
  def change
    add_column :transports, :departure_time, :string
  end
end
