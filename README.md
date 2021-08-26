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
|birthday                  |string  |null:false             |

### Association

- has_many :items
- has_many :purchases


## items table

|Column                    |Type      |Options                        |
|--------------------------|----------|-------------------------------|
|name                      |string    |null:false                     |
|image                     |Active Storage                            |
|explanation               |text      |null:false                     |
|category_id               |integer   |null:false                     |
|status_id                 |integer   |null:false                     |
|load_id                   |integer   |null:false                     |
|prefecture_id             |integer   |null:false                     |
|date_id                   |integer   |null:false                     |

### Association

- belongs_to: user
- has_one: purchase

## purchases table

|Column                    |Type      |Options                        |
|--------------------------|----------|-------------------------------|
|user                      |references|null:false, foreign_key: true  |
|item                      |references|null:false, foreign_key: true  |

### Association

- belongs_to: user
- belongs_to: item
- has_one: send


## sends table
|Column                    |Type      |Options                        |
|--------------------------|----------|-------------------------------|
|purchase                  |references|null:false, foreign_key: true  |
|post_number               |integer   |null:false                     |
|prefecture_id             |references|null:false, foreign_key: true  |
|municipality              |string    |null:false                     |
|address_number            |integer   |null:false                     |
|build                     |string    |                               |
|telephone                 |integer   |null:false                     |

### Association

- belongs_to: purchase