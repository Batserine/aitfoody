class Comment < ApplicationRecord
  belongs_to :user
  has_many :reviewComments, dependent: :destroy
  has_many :revarticles, through: :reviewComments
  # validates :comment, presence: true, message: 'You must provide the comment.'
  validates_presence_of :comment, message: 'You must provide the comment.'
end
