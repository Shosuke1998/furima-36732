# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------  | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| family_name        | string  | null: false |
| family_name_kana   | string  | null: false |
| first_name         | string  | null: false |
| first_name_kana    | string  | null: false |
| birth_year         | integer | null: false |
| birth_month        | integer | null: false |
| birth_day          | integer | null: false |

### Association

- has_many :items
- has_many :orders


## items テーブル

| Column             | Type      | Options                        |
| ------------------ | --------- | -------------------------------|
| name               | string    | null: false                    |
| content            | text      | null: false                    |
| category           | integer   | null: false                    |
| condition          | integer   | null: false                    |
| shipping-charge    | integer   | null: false                    |
| region             | integer   | null: false                    |
| date               | integer   | null: false                    |
| price              | integer   | null: false                    |
| user               | references| null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :orders

## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## addresses テーブル

| Column              | Type        | Options                        |
| --------------------|  -----------| -------------------------------|
| postal_code         | string      | null: false                    |
| prefecture          | integer     | null: false                    |
| city                | string      | null: false                    |
| house_number        | string      | null: false                    |
| building_name       | string      | null: false                    |
| telephone_number    | string      | null: false                    | 
| order               | references  | null: false, foreign_key: true |

### Association

- belongs_to :order

