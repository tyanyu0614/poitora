# アプリ名
TRAVEL SPACE

# 概要
旅行が直近のもので、どういった予約サイトを利用したのか？割引クーポンを使用して旅行したのか？等の
ノウハウに特化している情報共有できる媒体が少ないように感じたので、<br>
旅行計画やgotoトラベルキャンペーンの特典や割引の情報を効率的に調べることが実現したいと考え、
ユーザー登録機能、記事詳細機能。コメント機能、記事投稿機能、検索機能、いいね機能などを実装しました。

# DEMO動画
![demo](https://user-images.githubusercontent.com/73101963/102005378-ba30a300-3d5b-11eb-9166-e6f27f147d75.gif)


# 本番環境
[TRAVEL SPACE](https://poitora.herokuapp.com/ "TRAVEL SPACE")

ログイン情報(テスト用)

・Eメール: test@test<br>
・パスワード: qqqqqq1

# 制作背景(意図)
今回作成させていただいたのは、これから旅行しようと考えている方が
メインターゲットで、旅行した際にお得に旅ができた体験や、
今であれば、gotoトラベルキャンペーンなどもあるため、どの予約サイトから予約したほうがクーポンの割引などの恩恵があったか？またはポイント還元などが情報共有ができるアプリケーションを作成しました。
作成した理由としては、自分自身が旅行が好きで、毎回旅行に行くまでの情報収集がパワーがかかるため、そこの負担を削減したいと考え、この度作成しようと考えました。


# 工夫したポイント
・投稿記事が新しいものが上に来るように設定し、投稿日時を記載したこと。<br>
・AmazonS3を利用し画像が壊れないように設定。

# 使用技術(開発環境)

## バックエンド
Ruby,Ruby on Rails

## フロントエンド
HTML,CSS,JavaScript

## データベース
MySQL

## インフラ
heroku

## webサーバー(本番環境)
heroku

## アプリケーションサーバー(本番環境)
heroku

## ソース管理
GitHub,GitHubDesktop

## テスト
RSpec

## エディタ
VsCode

# 課題や今後実装したい機能
アバター機能、フォロー機能の追加、検索機能の強化(例:人気順で検索等)<br>
ユーザーが求めている有益な情報になるように投稿時の入力項目の追加。

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ----------------   | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| avatar             | integer| null: false |



### Association
- has_many :plans
- has_many :comments
- has_many :relationship
- has_many :likes



## comments テーブル

| Column            | Type       | Options                       |
| --------------    | ---------- | ----------------------------- |
| text              | text       | null: false                   |  
| user              | references | null: false,foreign_key: true |
| plan              | references | null: false,foreign_key: true |

### Association

- belongs_to :user
- belongs_to :plan



## plans テーブル

| Column           | Type       | Options                       |
| -----------------| ---------- | ----------------------------- |
| title            | string     | null: false                   |
| content          | text       | null: false                   |
| category_id      | integer    | null: false                   |
| cost             | integer    | null: false                   |
| user             | references | null: false,foreign_key: true |

### Association

- belongs_to :user
- has_many :comments

## relationship テーブル

| Column           | Type       | Options                        |
| -----------------| ---------- | -----------------------------  |
| follow           | string     | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## likes テーブル

| Column          | Type       | Options                        |
| -------------   | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| plan            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
