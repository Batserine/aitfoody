class AddImgPathToRevarticles < ActiveRecord::Migration[5.2]
  def change
    add_column :revarticles, :img_path, :string
  end
end
