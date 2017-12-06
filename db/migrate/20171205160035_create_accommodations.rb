class CreateAccommodations < ActiveRecord::Migration[5.1]
  def change
    create_table :accommodations do |t|
      t.references :step, foreign_key: true

      t.timestamps
    end
  end
end
