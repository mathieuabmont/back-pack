class CreateTransports < ActiveRecord::Migration[5.1]
  def change
    create_table :transports do |t|
      t.datetime :departure_time
      t.datetime :departure_date
      t.string :departure_location
      t.datetime :arrival_time
      t.datetime :arrival_date
      t.string :arrival_location
      t.references :step, foreign_key: true

      t.timestamps
    end
  end
end
