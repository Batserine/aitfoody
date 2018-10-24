class Revarticle < ApplicationRecord

  belongs_to :user
  belongs_to :typefood
  has_many :reviewComments
  has_many :comments, through: :reviewComments

  has_many :reviewIngredients
  has_many :ingredients, through: :reviewIngredients
end
