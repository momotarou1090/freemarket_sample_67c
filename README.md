# FREEMARKET_SAMPLE_67C DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, index: true|
|last_name|string|null: false|
|first_name|string|null: false|
|email|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_date|integer|null: false|
|phone_number|integer|null: false|

### Association
- has_many :adresses
- has_many :credits
- has_many :items


## creditsテーブル
|Column|Type|Options|
|------|----|-------|
|card_number|integer|null: false|
|period_month|integer|null: false|
|period_year|integer|null: false|
|secure|integer|null: false|
|user_id|reference|null: false, foreign_key: true|
### Association
- belongs_to :user 


## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|post_code|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|block|string|null: false|
|building|string|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|phone_number|string|null: false|
|user_id|reference|foreign_key: true|


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
|brand_id|reference|foreign_key: true|
|category_id|reference|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :brand
- belongs_to :category
- has_many :images 


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|text||
|item_id|reference|null: false, foreign_key: true|

### Association
- belongs_to :item


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_ancestory
- has_many :items

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
## Association
- has_many :items
