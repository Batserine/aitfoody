class ReviewIngredient < ApplicationRecord
  belongs_to :revarticle
  belongs_to :ingredient
end
