class Place < ApplicationRecord
  belongs_to :user
  validates_presence_of :title
  validates_uniqueness_of :title
  mount_uploader :img_path, ImageUploader

  validates_processing_of :img_path
  validate :image_size_validation

  private
  def image_size_validation
    errors[:img_path] << "should be less than 500KB" if img_path.size > 0.5.megabytes
  end
end
