class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string :title
      t.text :content
      t.string :img_path

      t.timestamps
    end
  end
end
