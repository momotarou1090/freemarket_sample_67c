class Image < ApplicationRecord
  mount_uploader :image, ImageUploader
  mount_uploader :image_02, ImageUploader
  mount_uploader :image_03, ImageUploader
  mount_uploader :image_04, ImageUploader
  mount_uploader :image_05, ImageUploader

  belongs_to :item
end
