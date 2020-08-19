# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column            | Type   | Options     |
| --------          | ------ | ----------- |
| nickname          | string | null: false |
| email             | string | null: false |
| password          | string | null: false |
| family_name       | string | null: false |
| first_name        | string | null: false |
| first_name_kana   | string | null: false |
| family_name_kana  | string | null: false |
| birthday         | date   | null: false |

### Association
- has_many :items
- has_many :purchase

## items テーブル

| Column            | Type     | Options           |
| ------            | ------   | -----------       |
| name              | string   | null: false       |
| price             | integer  | null: false       |
| text              | text     | null: false       |
| category_id       | integer  | null: false       |
| item_status_id    | integer  | null: false       |
| cost_burden_id    | integer  | null: false       |
| shipping_place_id | integer  | null: false       |
| ship_date_id      | integer  | null: false       |
| user_id           | integer  | foreign_key: true |

### Association
- belongs_to :user
- has_one_attached :image
- has_one :purchase

## image テーブル
| Column  | Type       | Options          |
| ------  | ---------- | ---------------- |
|  image  | text       |  null: false     |

## shipping_address テーブル

| Column | Type       | Options                   |
| ------ | ---------- | ----------------          |
|  postal_code     | integer |        null: false |
|  phone_number    | integer |        null: false |
|  prefectures_id  | integer |        null: false |
|  city            | string  |        null: false |
|  city_number     | string  |        null: false |
|  building_name   | string  |   |
|  purchase_id     | integer | foreign_key: true  |

### Association
- belongs_to :purchase

## purchase テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
|       user_id      | integer     | foreign_key: true  |
|       items_id     | integer     | foreign_key: true  |

### Association
- belongs_to :user
- belongs_to :items
- has_one :shipping_address
