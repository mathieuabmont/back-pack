class ChangeColumnNameToInvitations < ActiveRecord::Migration[5.1]
  def change
    rename_column :invitations, :itinerary_id, :trip_id
  end
end
