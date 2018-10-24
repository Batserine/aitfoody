class CreateReviewIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :review_ingredients do |t|
      t.references :revarticle, foreign_key: true
      t.references :ingredient, foreign_key: true

      t.timestamps
    end
  end
end
