## ER図

https://gyazo.com/91c0a61389bdb121b410381c4b1ae136

## users table​
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|password|string|null:false, length:{minimum:7}|
|email|string|null:false, unique:true, format:{/\A[a-zA-Z0-9_\#!$%&`'*+\-{|}~^\/=?\.]+@[a-zA-Z0-9][a-zA-Z0-9\.-]+\z/}|
|first_name|string|null: false|
|last_name|string|null: false|
|kana_first_name|string|null: false|
|kana_first_name|string|null: false|
|birthday|date|null: false|

### Association
- has_many :products
- has_one :delivery_address
- has_one :card
- has_one :purchase


## products table
|Column|Type|Options|
|------|----|-------|
|category_id|integer|null:false, forign_key:true|
|user_id|integer|null:false, forign_key:true|
|buyer_id|integer|null:false, forign_key:true|
|name|string|null: false|
|explanation|text|null: false|
|price|integer|null: false|
|brand|string||
|status|string|null: false|
|shipping_charges|integer|null: false|
|shipping_origin|string|null: false|
|days_until_shipping|integer|null: false|
|exhibition_status|integer|null: false|

### Association
- belongs_to :user
- has_many :images
- has_one :purchase
- belongs_to :category


## delivery address table
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null:false, forign_key:true|
|postal_code|integer|null:false, format:{with:^\d{3}-\d{4}$}|
|prefectures_code|string|null: false|
|city|string|null: false|
|address|string|null:false|
|building_name|string|
|phone_number|integer|

### Association
- belongs_to :user


## credit cards table  (PayJP)​
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|customer_id|integer|null: false|
|card_id|integer|null: false|

### Association
- belongs_to :user


## images table
|Column|Type|Options|
|------|----|-------|
|product_id|integer|null: false, foreign_key: true|
|src|string|null: false|

### Association
- belongs_to :product


## category table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, forign_key:true|
|ancestry|string|null: false, forign_key:true|

### Association
- has_many :products

## purchases table
|Column|Type|Options|
|------|----|-------|
|product_id|integer|null: false, foreign_key: true|
|buyer_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :product
- belongs_to :user