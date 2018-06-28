class AddUserToApplications < ActiveRecord::Migration[5.1]
  def change
    add_column :applications, :user_id, :integer
    add_index :applications, :user_id
  end
end
