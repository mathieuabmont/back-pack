class AddPhotoToSteps < ActiveRecord::Migration[5.1]
  def change
    add_column :steps, :photo, :string
  end
end
