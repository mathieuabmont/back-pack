class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.string :photo
      t.references :transport, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
