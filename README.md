# テーブル 設計

## users テーブル

| Column                | Type    | Options     |
| --------------------- | ------- | ----------- |
| nickname              | string  | null: false |
| email                 | string  | null: false |
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
| name             | string    | null: false                    |
| text             | text      | null: false                    |
| price            | integer   | null: false                    |
| category_id      | integer   | null: false                    |
| item_status_id   | integer   | null: false                    |
| shipping_cost_id | integer   | null: false                    |
| shipping_area_id | integer   | null: false                    |
| shipping_days_id | integer   | null: false                    |
| user             | reference | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :order


## orders テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | reference  | null: false, foreign_key: true |
| item      | reference  | null: false, foreign_key: true |                    |

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
| phone_number     | string    | null: false                    |
| order            | reference | null: false, foreign_key: true |

### Association

- belongs_to :order
