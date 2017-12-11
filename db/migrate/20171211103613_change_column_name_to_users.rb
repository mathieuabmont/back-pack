class ChangeColumnNameToUsers < ActiveRecord::Migration[5.1]
  def change
    rename_column :invitations, :user_id, :invitee_id
  end
end
