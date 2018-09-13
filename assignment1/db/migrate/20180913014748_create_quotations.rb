class CreateQuotations < ActiveRecord::Migration[5.2]
  def change
    create_table :quotations do |t|
      t.string :author_name
      t.string :category
      t.string :quote

      t.timestamps
    end
  end
end
