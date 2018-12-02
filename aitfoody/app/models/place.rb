class Place < ApplicationRecord
  mount_uploader :img_path, ImageUploader
end
