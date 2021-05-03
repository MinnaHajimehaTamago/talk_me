![read_me_image](https://user-images.githubusercontent.com/74609389/116797468-dffaf080-ab20-11eb-9d9c-0ca91cafd564.jpeg)

# Talk me

# アプリケーション概要

Talk meは「話したい人」から「話しかけてもらう」ためのアプリです。話したい人へサイン（目印）を送り、気づいてもらうことで会話が始まります。

# 本番環境
https://talk-me-by-minnahajimehatamago.herokuapp.com/

# 制作背景

日常の中でのちょっとしたコミュニケーションの壁を乗り越えることを目的に、このアプリを作成しました。「話をしてみたいが接点がないためにコミュニケーションの一歩目を踏み出せない」ことや、「お互いの関係性によって話しにくいことがある」など、話をしたい気持ちはあるが色々なことに気を遣ってしまうために、せっかくのコミュニケーションの機会を損失していることが現代では多くあると感じ、その損失を減らすことができればという思いからこのアプリの作成に至りました。

# DEMO
## プロフィールタグ登録画面

## トップページ

## サイン送信画面

## サイン検索画面

## サイン検索結果画面

## サイン詳細画面

## トークルーム画面

## ユーザー詳細画面





# 工夫したポイント

- 現実世界でもSNSでも繋がっていない「目の前の人」と繋がることができるように工夫しました。話しかけてほしい人について知っている情報を「タグ」として複数つけることでWeb上でもその人とマッチできるようにしました。
- 新規ユーザーもすぐにアプリを楽しめるよう、新規登録時のユーザーのプロフィールタグを登録させ、自分宛のサイン候補をトップページに表示されるようにしました。

# 使用技術
## バックエンド
Ruby, Ruby on Rails

## フロントエンド
Slim, Scss, JavaScript, JQuery, Ajax

## データベース
MySQL, SequelPro

## インフラ


## Webサーバ（本番環境）


## アプリケーションサーバ（本番環境）


## ソース管理
GitHub, GitHubDesktop

## テスト
RSpec

## エディタ
VSCode

# DB設計
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
| none                                                       |

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

## ローカルでの動作方法
①アプリの複製

git clone https://github.com/MinnaHajimehaTamago/talk_me.git

②gemのインストール

bundle install

※ruby -> '2.6.5', rails -> '6.0.0'

③データベース作成

rails db:create

rails db:migrate
