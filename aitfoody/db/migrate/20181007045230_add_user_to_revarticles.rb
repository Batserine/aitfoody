class AddUserToRevarticles < ActiveRecord::Migration[5.2]
  def change
    add_reference :revarticles, :user, foreign_key: true
  end
end
