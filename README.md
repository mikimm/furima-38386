# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname               | string | null: false |
| email                  | string | null: false |
| password               | string | null: false |
| password_confirmation  | string | null: false |
| name_hira              | string | null: false |
| name_kana              | string | null: false |
| birth                  | string | null: false |
- has_many :item
- has_many :purchase

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| image         | string | null: false |
| name          | string | null: false |
| explanation   | string | null: false |
| condition     | string | null: false |
| price         | string | null: false |
| category      | string | null: false |
- belongs_to :user

## purchase テーブル

| Column | Type       | Options                        |     
| ------ | ---------- | ------------------------------ |
| card                | string | null: false |
| valid               | string | null: false |
| security_code       | string | null: false |   
| items               | references | foreign_key: true |  
| adress              | references | foreign_key: true |  
- belongs_to :user
- belongs_to :adress

## adress テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| reigon              　| string | null: false |
| municipalities       | string | null: false |
| address              | string | null: false |  
| building             | string | null: false |
| phone_number      　　| string | null: false |  

- has_one:purchase