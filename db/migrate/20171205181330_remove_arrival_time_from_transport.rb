class RemoveArrivalTimeFromTransport < ActiveRecord::Migration[5.1]
  def change
    remove_column :transports, :arrival_time, :datetime
  end
end
