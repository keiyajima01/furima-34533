# テーブル 設計

## users テーブル

| Column                | Type    | Options     |
| --------------------- | ------- | ----------- |
| nickname              | string  | null: false |
| email                 | string  | null: false |
| password              | string  | null: false |
| encrypted_password    | string  | null: false |
| last_name             | string  | null: false |
| first_name            | string  | null: false |
| last_name_kana        | string  | null: false |
| first_name_kana       | string  | null: false |
| birthday              | date    | null: false |

### Association

- has_many :items
- has_many :orders


## items テーブル

| Column           | Type      | Options                        |
| ---------------- | --------- | ------------------------------ |
| item_name        | string    | null: false                    |
| item_text        | text      | null: false                    |
| price            | integer   | null: false                    |
| category_id      | integer   | null: false                    |
| item_status_id   | integer   | null: false                    |
| shipping_price   | integer   | null: false                    |
| shipping_cost_id | integer   | null: false                    |
| shipping_area_id | integer   | null: false                    |
| shipping_days_id | integer   | null: false                    |
| user_id          | reference | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :order


## orders テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user_id   | reference  | null: false, foreign_key: true |
| item_id   | reference  | null: false, foreign_key: true |                    |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :shipping


## shippings テーブル

| Column           | Type      | Options                        |
| ---------------- | --------- | ------------------------------ |
| postal_code      | string    | null: false                    |
| municipality     | string    | null: false                    |
| address          | string    | null: false                    |
| building_name    | string    |                                |
| phone_number     | integer   | null: false                    |
| order_id         | reference | null: false, foreign_key: true |

### Association

- belongs_to :order
