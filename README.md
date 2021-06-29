# users
|Column|Type|Options|

|nickname          |string|null: false|
|email             |string|null: false|
|encrypted_password|string|null: false|
|family_name       |string|null: false|
|first_name        |string|null: false|
|family_name_kana  |string|null: false|
|first_name_kana   |string|null: false|
|birthday          |date  |null: false|

### Association

has_many :item 
belongs_to :card 
belongs_to :destination 

# purchases

|item|reference|null: false|
|user|reference|null: false, foreign_key: true|

### Association

belongs_to :user
belongs_to :item
belongs_to :destination

# destination

|family_name   |string|null: false|
|first_name    |string|null: false|
|post_code     |string|null: false|
|prefecture    |string|null: false|
|city          |string|null: false|
|adress        |string|null: false|
|building_name |string|           |
|phone_number  |string|           |

### Association

belongs_to :purchases

# item

|image        |string |null: false|
|name         |string |null: false|
|description  |string |null: false|
|status_id    |integer|null: false|
|category_id  |integer|null: false,|foreign_key: true|
|price        |integer|null: false|
|prefecture_id|integer|null: false|
|day_id       |integer|null: false|
|brand_id     |integer|null: false|
### Association

belongs_to :user
has_one :purchase
