class Item < ApplicationRecord
  mount_uploader :image, ImageUploader
  
  has_many :images
  accepts_nested_attributes_for :images # item保存時に、imageテーブルにレコードを保存するため
  
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :region
end