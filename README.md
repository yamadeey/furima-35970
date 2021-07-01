# users
|Column|Type|Options|

|nickname          |string|null: false|
|email             |string|null: false,unique: true|
|encrypted_password|string|null: false|
|family_name       |string|null: false|
|first_name        |string|null: false|
|family_name_kana  |string|null: false|
|first_name_kana   |string|null: false|
|birthday          |date  |null: false|

### Association

has_many :items  
has_many :purchases 

# purchases

|item|reference|null: false, foreign_key: true|
|user|reference|null: false, foreign_key: true|

### Association

belongs_to :user
belongs_to :item
has_one    :destination

# destinations

|purchase      |references|foreign_key: true|
|post_code     |string |null: false|
|prefecture_id |integer|null: false|
|city          |string |null: false|
|address        |string |null: false|
|building_name |string |           |
|phone_number  |string |null: false|

### Association

belongs_to :purchase

# items

|name         |string |null: false|
|description  |text   |null: false|
|status_id    |integer|null: false|
|category_id  |integer|null: false|
|price        |integer|null: false|
|prefecture_id|integer|null: false|
|date_id      |integer|null: false|
|brand_id     |integer|null: false|
|burden       |integer|null: false|
### Association

belongs_to :user
has_one :purchase


