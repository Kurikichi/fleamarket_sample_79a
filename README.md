<!-- # README

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ... -->
## ER図

[ER図.pdf](https://github.com/Kurikichi/fleamarket_sample_79a/files/4959984/ER.pdf)


## users table​
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|password|string|null:false, length:{minimum:7}|
|confirmation_password|null:false, length:{minimum:7}|
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


## products table
|Column|Type|Options|
|------|----|-------|
|category_id|integer|null:false, forign_key:true|
|user_id|integer|null:false, forign_key:true|
|name|string|null: false|
|explanation|text|null: false|
|price|integer|null: false|
|brand|string||
|status|string|null: false|
|shipping_charges|integer|null: false|
|shipping_origin|string|null: false|
|days_until_shipping|integer|null: false|

### Association
- belongs_to :user
- has_many :images
- belongs_to category


## delivery address table
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null:false, forign_key:true|
|postal_code|integer|null:false, format:{with:^\d{3}-\d{4}$}|
|prefectures|string|null: false|
|city|string|null: false|
|address|string|null:false|
|building_name|string||
|phone_number|integer||

### Association
- belongs_to :user


## card table  (PayJP)​
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
|image|string|null: false|

### Association
- belongs_to :product


## category table
|Column|Type|Options|
|------|----|-------|
|category_name|string|null: false|
|ancestry|string|null: false|

### Association
- has_many :products