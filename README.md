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
| text           | text       | null: false                   |  
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
