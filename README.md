# テーブル 設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :items
- has_many :orders


## items テーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| item_name    | string  | null: false |
| category     | string  | null: false |
| price        | integer | null: false |

### Association

- belongs_to :user
- has_many   :orders


## orders テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| seller    | string     | null: false                    |
| purchaser | string     | null: false                    |
| user_id   | reference  | null: false, foreign_key: true |
| item_id   | reference  | null: false, foreign_key: true |                    |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :shippings

## shippings テーブル

| Column           | Type      | Options                  |
| ---------------- | --------- | ------------------------ |
| address          | string    | null: false              |
| purchaser        | string    | null: false              |
| shipping_price   | integer   | null: false              |
| shipping_charges | integer   | null: false              |

### Association

- belongs_to :order
