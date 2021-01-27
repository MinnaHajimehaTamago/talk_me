# README

# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_nama_kana     | string | null: false               |
| birth_data         | data   | null: false               |


### Association

- has_many :signs
- hsa_many :favorites
- has_many :spots
- has_one_attached :image


## signs テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| first_name        | string     | null: false                    |
| last_name         | string     | null: false                    |
| first_name_kana   | string     | null: false                    |
| last_name_kana    | string     | null: false                    |
| state_id          | integer    | null: false                    |
| city              | string     | null: false                    |
| spot_type_id      | integer    | null: false                    |
| position_id       | integer    | null: false                    |
| characteristic_id | integer    | null: false                    |
| content_id        | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |


### Association

- belongs_to :uer
- has_many :favorites

## favorites テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| sign   | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :sign

## spots テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| state_id     | integer    | null: false                    |
| city         | integer    | null: false                    |
| spot_type_id | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :user