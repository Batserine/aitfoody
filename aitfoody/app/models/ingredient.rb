class Ingredient < ApplicationRecord
  has_many :reviewIngredients
  has_many :revarticles, through: :reviewIngredients
end
