class AddTypefoodToRevarticle < ActiveRecord::Migration[5.2]
  def change
    add_reference :revarticles, :typefood, foreign_key: true
  end
end
