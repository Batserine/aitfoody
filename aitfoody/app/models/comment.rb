class Comment < ApplicationRecord
  belongs_to :user
  has_many :reviewComments
  has_many :revarticles, through: :reviewComments
end
