# README

# テーブル設計

## users table

|Column                    |Type    |Options     |
|--------------------------|--------|------------|
|name                      |string  |null: false |
|email                     |t.string|null: false |
|password                  |string  |null:false  |
|last_name_full_width      |string  |null:false  |
|first_name_full_width     |string  |null:false  |
|last_name_full_width_kana |string  |null:false  |
|first_name_full_width_kana|string  |null:false  |
|birthday                  |string  |null:false  |

### Association

- has_many :items
- has_many :purchases


## items table

|Column                    |Type      |Options                        |
|--------------------------|----------|-------------------------------|
|user_id                   |references|null:false, foreign_key: true  |
|name                      |string    |null:false                     |
|image                     |Active Storage                            |
|price                     |string    |null:false                     |
|memo                      |string    |null:false                     |
|explanation               |text      |null:false                     |
|category                  |string    |null:false                     |
|status                    |string    |null:false                     |
|load                      |string    |null:false                     |
|area                      |string    |null:false                     |
|date                      |string    |null:false                     |

### Association

- belongs_to:user
- has_one_attached: purchase

## purchases table

|Column                    |Type      |Options                        |
|--------------------------|----------|-------------------------------|
|user_id                   |references|null:false, foreign_key: true  |
|item_id                   |references|null:false, foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :item
- has_one_attached :send


## sends table
|Column                    |Type      |Options                        |
|--------------------------|----------|-------------------------------|
|purchase_id               |references|null:false, foreign_key: true  |
|post_number               |string    |null:false                     |
|prefecture                |string    |null:false                     |
|municipality              |string    |null:false                     |
|address                   |string    |null:false                     |
|build                     |string    |                               |
|telephone                 |string    |null:false                     |

### Association

- has_one_attached :purchase