# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname               | string | null: false |
| email                  | string | null: false,unique: true |
| encrypted_password　  　| string | null: false |
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
| category_id      | integar| null: false |
| price_id         | integar| null: false |
| condition_id     | integar| null: false |
| burden_id        | integar| null: false |
| region_id        | integar| null: false |
| shippment_days_id| integar| null: false |
| users      | references | foreign_key: true |  

- belongs_to :user
- has_one :order
## orders テーブル

| Column | Type       | Options                        |     
| ------ | ---------- | ------------------------------ |
| users        | references | foreign_key: true |  
| items        | references | foreign_key: true |
- belongs_to :user
- belongs_to :item
- has_one :adress
## adresses テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| post_number      　  | string | null: false |  
| prefecture_id          | integar | null: false |
| municipalities       | string | null: false |
| address              | string | null: false |  
| building             | string |
| phone_number      　　| string | null: false |  
| orders      　　      | references | foreign_key: true | 
- belongs_to :order