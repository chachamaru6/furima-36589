# README

# テーブル設計

## users table

|Column                    |Type    |Options                |
|--------------------------|--------|-----------------------|
|name                      |string  |null: false            |
|email                     |string|null: false,unique: true |
|encrypted_password        |string  |null:false             |
|last_name_full_width      |string  |null:false             |
|first_name_full_width     |string  |null:false             |
|last_name_full_width_kana |string  |null:false             |
|first_name_full_width_kana|string  |null:false             |
|birthday                  |date    |null:false             |

### Association

- has_many :items
- has_many :purchases


## items table

|Column                    |Type      |Options                        |
|--------------------------|----------|-------------------------------|
|name                      |string    |null:false                     |
|explanation               |text      |null:false                     |
|category_id               |integer   |null:false                     |
|status_id                 |integer   |null:false                     |
|load_id                   |integer   |null:false                     |
|prefecture_id             |integer   |null:false                     |
|schedule_id               |integer   |null:false                     |
|price                     |integer   |null:false                     |
|user                      |references|null:false, foreign_key: true  |


## |image                     |Active Storage                            |

### Association

- belongs_to: user
- has_one: order
- has_many_attached :image

## orders table

|Column                    |Type      |Options                        |
|--------------------------|----------|-------------------------------|
|user                      |references|null:false, foreign_key: true  |
|item                      |references|null:false, foreign_key: true  |

### Association

- belongs_to: user
- belongs_to: item
- has_one: address


## addresses table
|Column                    |Type      |Options                        |
|--------------------------|----------|-------------------------------|
|order                     |references|null:false, foreign_key: true  |
|post_number               |string    |null:false                     |
|prefecture_id             |integer   |null:false                     |
|city                      |string    |null:false                     |
|address_num               |string    |null:false                     |
|building_name             |string    |                               |
|telephone                 |string    |null:false                     |

### Association

- belongs_to: order