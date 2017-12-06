class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.string :title
      t.string :url
      t.string :photo
      t.references :step, foreign_key: true

      t.timestamps
    end
  end
end
