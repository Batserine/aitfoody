class CreateReviewComments < ActiveRecord::Migration[5.2]
  def change
    create_table :review_comments do |t|
      t.references :revarticle, foreign_key: true
      t.references :comment, foreign_key: true

      t.timestamps
    end
  end
end
