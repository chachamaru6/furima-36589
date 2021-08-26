# README

# テーブル設計

## users table

|Column                    |Type  |Options     |
|--------------------------|------|------------|
|name                      |string|null: false |
|email                     |string|null: false |
|password                  |string|null:false  |
|last_name_full_width      |string|null:false  |
|first_name_full_width     |string|null:false  |
|last_name_full_width_kana |string|null:false  |
|first_name_full_width_kana|string|null:false  |
|birthday                  |string|null:false  |

### Association

- has_many :items
- has_many :purchases, through: items


## items table

|Column                    |Type      |Options                        |
|--------------------------|----------|-------------------------------|
|user                      |references|null:false, foreign_key: true  |
|name                      |string    |null:false                     |
|image                     |Active Storage                            |
|price                     |string    |null:false                     |
|memo                      |string    |null:false                     |
|explanation               |string    |null:false                     |
|category                  |string    |null:false                     |
|status                    |string    |null:false                     |
|explanation               |string    |null:false                     |
|load                      |string    |null:false                     |
|area                      |string    |null:false                     |
|date                      |string    |null:false                     |

### Association

- belongs_to:user

## purchases table

|Column                    |Type      |Options                        |
|--------------------------|----------|-------------------------------|
|user                      |references|null:false, foreign_key: true  |
|item                      |references|null:false, foreign_key: true  |
|payment                   |string    |null:false                     |
|card_info                 |string    |null:false                     |
|date_of_expiry            |string    |null:false                     |
|code                      |string    |null:false                     |

### Association

- belongs_to :user
- belongs_to :item


## sends table
|Column                    |Type      |Options                        |
|--------------------------|----------|-------------------------------|
|purchase                  |references|null:false, foreign_key: true  |
|post_number               |string    |null:false                     |
|prefecture                |string    |null:false                     |
|municipality              |string    |null:false                     |
|address                   |string    |null:false                     |
|build                     |string    |null:false                     |
|telephone                 |string    |null:false                     |

### Association

- belongs_to :purchase