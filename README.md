# README

# アプリ名

フリマアプリ37094
<br>
<br>

# アプリケーションの概要

ユーザーを登録すると商品を出品できるようになります。自身が出品した商品は、編集と削除をすることができます。他のユーザーが出品した商品は、クレジットカードを用いて購入することができます。
<br>
<br>

# URL 
#### AWS EC2によるデプロイ（停止中）


#### Herokuによるデプロイ
https://furima-37094.herokuapp.com/

#### Basic認証
- ID: admin
- Pass: 2222
<br>
<br>

# テスト用アカウント
#### 購入者用
- メールアドレス: 
- パスワード: 

#### 購入用カード情報(PAYJPテスト用)
- 番号：
- 期限：月/年
- セキュリティコード：

#### 出品者用
- メールアドレス名: 
- パスワード: 
<br>
<br>

# 実装機能

## トップページ

<br>

## 1.ユーザー登録機能
ユーザー登録することで出品・購入できるようになる。（ユーザー登録していない人でも出品している商品を見ることは可能。）


<br>

## 2.商品出品機能
商品画像を選択し、商品情報や販売したい金額を入力すると、出品することができる。（JavaScriptで販売手数料が表示されるようになっている。）



<br>

## 3.商品の編集機能
出品した商品について、編集することができます。その際に、ユーザーの手間を省くため出品時の情報が表示されるようになっています。



## 4.商品の削除機能
出品中であった商品について、削除ボタンを押すことで商品を削除することができます。



<br>

## 5.商品の購入機能
出品者以外であれば、商品を購入することができます。カード情報と配送先を入力すると購入できます。（JavaScriptとフォームオブジェクトを使用し、トークン化したカード情報をPAY.JPに送付しつつ、カード情報がアプリケーションのデータベースに保存されないように設計しています。）



<br>
<br>

# ER 図


<br>
<br>

# テーブル設計

### users テーブル

| Column             | Type   | Options                   |
| :----------------- | :----- | :------------------------ |
| nickname           | string | null: false, unique: true |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false, unique: true |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

#### Association

- has_many :items
- has_many :orders
- has_many :comments

<br>

### items テーブル

| Column           | Type       | Options                        |
| :--------------- | :--------- | :----------------------------- |
| user             | references | null: false, foreign_key: true |
| name             | string     | null: false                    |
| description      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| item_status_id   | integer    | null: false                    |
| shipping_cost_id | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| shipping_date_id | integer    | null: false                    |
| price            | integer    | null: false                    |

#### Association

- belongs_to :user
- has_one :order
- has_many :comments

<br>

### orders テーブル

| Column | Type       | Options                        |
| :----- | :--------- | :----------------------------- |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

#### Association

- belongs_to :user
- belongs_to :item
- has_one :payment

<br>

### payments テーブル

| Column        | Type       | Options                        |
| :------------ | :--------- | :----------------------------- |
| orders        | references | null: false, foreign_key: true |
| postcode      | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| block         | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |

#### Association

- belongs_to :order

<br>

### comments テーブル

| Column | Type       | Options                        |
| :----- | :--------- | :----------------------------- |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |
| text   | text       | null: false                    |

#### Association

- belongs_to :user
- belongs_to :item

<br>
<br>



<br>
<br>


