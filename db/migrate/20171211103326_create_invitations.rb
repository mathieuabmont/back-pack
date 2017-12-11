class CreateInvitations < ActiveRecord::Migration[5.1]
  def change
    create_table :invitations do |t|
      t.string :email
      t.string :code
      t.string :status
      t.references :itinerary, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
