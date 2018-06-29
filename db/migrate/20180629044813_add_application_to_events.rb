class AddApplicationToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :application_id, :integer
    add_index :events, :application_id
  end
end
