class Revarticle < ApplicationRecord

  belongs_to :user
  belongs_to :typefood
  has_many :reviewComments
  has_many :comments, through: :reviewComments

  # has_many :reviewIngredients
  # has_many :ingredients, through: :reviewIngredients
  validates_presence_of :title
  validates_uniqueness_of :title

  # has_paper_trail
  has_paper_trail on: [:update]
  def user_name
    user ? user.email : ''
  end

  mount_uploader :img_path, ImageUploader

  validates_processing_of :img_path
  validate :image_size_validation

  private
  def image_size_validation
    errors[:img_path] << "should be less than 500KB" if img_path.size > 0.5.megabytes
  end
end
