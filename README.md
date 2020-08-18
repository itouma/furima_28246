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

| Column           | Type   | Options     |
| --------         | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| family_name      | string | null: false |
| first_name       | string | null: false |
| first_name_kana  | string | null: false |
| family_name_kana | string | null: false |
| birthday         | integer | null: false |

### Association
- has_many :items
- has_one :credit_card
- has_one :shipping_address

## items テーブル

| Column         | Type    | Options     |
| ------         | ------  | ----------- |
| name           | string  | null: false |
| price          | integer | null: false |
| category       | string  | null: false |
| item_status    | string  | null: false |
| text           | text    | null: false |
| cost_burden    | string  | null: false |
| shipping_place | string  | null: false |
| ship_date      | integer | null: false |
| user_id        | integer |             |

### Association
- belongs_to :user
- has_one_attached :image

## image テーブル
| Column  | Type       | Options          |
| ------  | ---------- | ---------------- |
|  image  | text       |  null: false     |

## shipping_address テーブル

| Column | Type       | Options          |
| ------ | ---------- | ---------------- |
|  postal_code  | integer |  null: false |
|  phone_number | integer |  null: false |
|  prefectures  | string  |  null: false |
|  city         | string  |  null: false |
|  city_number  | string  |  null: false |
|  building_name| string  |   |

### Association
- belongs_to :user

## credit_card テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| number             | integer     |      null: false   |
| expiration_date    | integer     |      null: false   |
|       CSC          | integer     |      null: false   |
|       user_id      | integer     |         |

### Association
- belongs_to :user