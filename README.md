# README

# アプリケーション概要
カテゴリに紐づくアイデアの作成、検索ができるアプリケーションです。

# 利用方法

# 要件定義


# テーブル設計
## Categories テーブル
| Column   | Type    | Options                   |
| -------- | ------- | ------------------------- |
| id       | bigint  |                           |
| name     | string  | null:false, unique:true   |


### Association
- has_many :ideas

## Ideas テーブル
| Column      | Type    | Options                       |
| ----------- | ------- | ----------------------------- |
| id          | bigint  |                               |
| name        | string  | null:false                    |
| body        | text    | null:false                    |
| category_id | bigint  | null:false, foreign_key: true |


### Association
- belongs_to :category
