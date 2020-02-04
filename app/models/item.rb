class Item < ApplicationRecord

  has_many :images, dependent: :destroy

  accepts_nested_attributes_for :images # item保存時に、imageテーブルにレコードを保存するため
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :region
end
  