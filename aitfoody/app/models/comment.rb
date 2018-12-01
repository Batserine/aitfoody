class Comment < ApplicationRecord
  belongs_to :user
  has_many :reviewComments, dependent: :destroy
  has_many :revarticles, through: :reviewComments

end
