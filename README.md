# README

## usersテーブル

| Column               | Type    | Options                   |
| -------------------- | ------- | ------------------------- |
| nickname             | string  | null: false               |
| email                | string  | unique: true, null: false |
| encrypted_password   | string  | null: false               |
| last_name            | string  | null: false               |
| first_name           | string  | null: false               |
| last_name_kana       | string  | null: false               |
| first_name_kana      | string  | null: false               |
| birthday             | date    | null: false               |


### Association

- has_many :items
- has_many :histories

## items テーブル

| Column         | Type       | Options                              |
| -------------  | ---------- | ------------------------------------ |
| name           | string     | null: false                          |
| price          | integer    | null: false                          |
| description    | text       | null: false                          |
| condition_id   | integer    | null: false                          |
| shipping_id    | integer    | null: false                          |
| area_id        | integer    | null: false                          |  
| preparation_id | integer    | null: false                          |
| category_id    | integer    | null: false                          |
| user           | references | null: false, foreign_key: true       |

### Association

- belongs_to :user
- has_one :history

## addresses テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postcode         | string     | null: false                    |
| area_id          | integer    | null: false                    |
| address_city     | string     | null: false                    |
| address_street   | string     | null: false                    |
| address_building | string     |                                |
| phone_number     | string     | null: false                    |
| history          | references | null: false, foreign_key: true |


### Association
- belongs_to :history

## histories テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null:false, foreign_key: true  | 
| item   | references | null:false, foreign_key: true  |

### Association
- has_one :address
- belongs_to :user
- belongs_to :item