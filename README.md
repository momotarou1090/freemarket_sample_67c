# FREEMARKET_SAMPLE_67C DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, index: true|
|last_name|string|null: false|
|first_name|string|null: false|
|email|string|null: false|
|year|integer|null: false|
|month|integer|null: false|
|date|integer|null: false|
|phone|integer|null: false|

### Association
- has_many :adresses
- has_many :credits
- has_many :items


## creditsテーブル
|Column|Type|Options|
|------|----|-------|
|card_number|integer|null: false|
|period|integer|null: false|
|secure|integer|null: false|

### Association
- belongs_to :user 


## adressesテーブル
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
- belongs_to :user


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|null: false|
|condition|string|null: false|
|postage|string|null: false|
|region|string|null: false|
|shipping_date|string|null: false|
|seller_id|string|null: false|
|buyer_id|interger|

### Association
- belongs_to :user
- belongs_to :brand
- belongs_to :category
- has_many :images 


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|text||

### Association
- belongs_to :item


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_ancestory
- has_many :brands, through: :category_bland
- has_many :category_bland
- has_many :items

## blandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|s
## Association
- has_many :categories, through: :category_bland
- has_many :category_bland
- has_many :items


## category_blandテーブル
|Column|Type|Options|
|------|----|-------|
|categorys_id|references|null: false, foreign_key: true|
|blands_id|references|null: false, foreign_key: true|

### Association
belongs_to category
belongs_to bland







