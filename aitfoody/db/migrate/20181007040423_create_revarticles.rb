class CreateRevarticles < ActiveRecord::Migration[5.2]
  def change
    create_table :revarticles do |t|
      t.string :title
      t.text :content
      t.integer :rating
      t.integer :price
      t.string :keywords
      t.string :location

      t.timestamps
    end
  end
end
