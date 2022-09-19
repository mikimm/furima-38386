# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname               | string | null: false |
| email                  | string | null: false |
| password_confirmation  | string | null: false |
| lastname               | string | null: false |
| firstname              | string | null: false |
| lastname_kana          | string | null: false |
| firstname_kana         | string | null: false |
| date_of_birth          | date   | null: false |
- has_many :items
- has_many :orders

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name          | string | null: false |
| explanation   | text   | null: false |
| category      | integar| null: false |
| price         | integar| null: false |
| condition     | integar| null: false |
| burden        | integar| null: false |
| region        | integar| null: false |
| shippment_days| integar| null: false |
| users_id      | references | foreign_key: true |  

- belongs_to :users
- has_one :orders
## orders テーブル

| Column | Type       | Options                        |     
| ------ | ---------- | ------------------------------ |
| users_id         | references | foreign_key: true |  
| items_id         | references | foreign_key: true |
- belongs_to :users
- belongs_to :items
- has_one :adresses
## adresses テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| phost_number      　  | string | null: false |  
| prefectures          | integar | null: false |
| municipalities       | string | null: false |
| address              | string | null: false |  
| building             | string | null: false |
| phone_number      　　| string | null: false |  
| orders_id      　　      | references | foreign_key: true | 
- belongs_to :orders