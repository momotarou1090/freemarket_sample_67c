# FREEMARKET_SAMPLE_67C DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false,unique: true,index: true|
|last_name|string|null: false|
|first_name|string|null: false|
|year|integer|null: false|
|month|integer|null: false|
|date|integer|null: false|
|phone|integer|null: false|
### Association
- belongs_to :adress
- belongs_to :credits
- belongs_to :items

## adressテーブル
|Column|Type|Options|
|------|----|-------|
|post_code|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|block|string|null: false|
|building|string|null: false|
|phone|string|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
### Association
- has_many :users

## creditテーブル
|Column|Type|Options|
|------|----|-------|
|card_number|integer|null: false|
|period|integer|null: false|
|secure|integer|null: false|
### Association
- has_many :users 

## blandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
## Association
- categorys through:bland

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- blands through:bland_category
- has_ancestory

## bland_categoryテーブル
|Column|Type|Options|
|------|----|-------|
|categorys_id|references|null: false, foreign_key: true|
|blands_id|references|null: false, foreign_key: true|
### Association
belongs_to categorys
belongs_to blands

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|null: false|
|condition|string|null: false|
|postage|string|null: false|
|region|string|null: false|
|shipping_date|string|null: false|
|Seller_id|string|null: false|
|buyer_id|interger|
### Association
- has_many :users
- blands through:item_bland
- categorys through:item_category
- belongs_to images

## item_bland
|Column|Type|Options|
|------|----|-------|
|blans_id|references|null: false|
|items_id|references|null: false|
### Association
- belongs_to items
- belongs_to blands

## item_category
|Column|Type|Options|
|------|----|-------|
|items_id|references|null: false|
|category_id|references|null: false|
### Association
- belongs_to items
- belongs_to categorys

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|text||
### Association
- has_many :items