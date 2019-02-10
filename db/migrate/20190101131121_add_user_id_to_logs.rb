class AddUserIdToLogs < ActiveRecord::Migration[5.2]
  def change
    add_column :logs, :user_id, :integer
  end
end
