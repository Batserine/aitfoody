class AddBanStatusToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :ban_status, :boolean, default: false
  end
end
