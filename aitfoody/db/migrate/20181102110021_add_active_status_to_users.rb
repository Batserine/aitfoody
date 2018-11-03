class AddActiveStatusToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :active_status, :boolean, default: true
  end
end
