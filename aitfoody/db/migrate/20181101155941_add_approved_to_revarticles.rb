class AddApprovedToRevarticles < ActiveRecord::Migration[5.2]
  def change
    add_column :revarticles, :approved, :boolean, default: false
  end
end
