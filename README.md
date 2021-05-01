# README

# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |


### Association

- has_many :signs
- hsa_many :rooms
- has_many :tags
- has_one_attached :image


## signs テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| text              | text       | null: false                    |
| user              | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_many :tags

## tags テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| name             | string  | null: false |
| officiality_id   | integer | null: false |


### Association

- has_many :users
- has_many :signs

## room テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| none         |            |                                |

### Association

- has_many: users
- has_many: messages

## messages テーブル

| Column | Type | Options                        |
| ------ | ---- | ------------------------------ |
| text   | text | null: false                    |
| room   | text | null: false, foreign_key: true |
| user   | text | null: false, foreign_key: true |

### Association

- belongs_to :room