class AddIngredientToRevarticles < ActiveRecord::Migration[5.2]
  def change
    add_column :revarticles, :ingredient, :string
  end
end
