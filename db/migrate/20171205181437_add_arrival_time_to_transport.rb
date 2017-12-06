class AddArrivalTimeToTransport < ActiveRecord::Migration[5.1]
  def change
    add_column :transports, :arrival_time, :string
  end
end
