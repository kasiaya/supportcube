# テーブル設計

## staffs テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| employee_id        | string | null: false, unique: true  |
| department         | string | null: false |
| staff_name         | string | null: false |
| staff_name_kana    | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |


### Association

- has_many :referrals


## referrals テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| patient_name       | string     | null: false |
| age                | integer    | null: false |
| gender             | integer    | null: false |
| history            | integer    | null: false |
| purpose            | integer    | null: false |
| adl                | string     |             |
| insurance          | integer    | null: false |
| prognosis          | string     |             |
| requested_date     | date       |             |
| admission_date     | date       |             |
| status             | integer    | null: false |
| determination      | integer    | null: false |
| memo               | text       |             |
| staff              | references | null: false, foreign_key: true |
| partner            | references | null: false, foreign_key: true |
| doctor             | references | null: false, foreign_key: true |

### Association

- belongs_to :staff
- belongs_to :partner
- belongs_to :doctor


##  partners テーブル

| Column                   | Type       | Options     |
| ------------------------ | ---------- | ----------- |
| institution_name         | string     | null: false |
| institution_category_id  | integer    | null: false |


### Association

- has_many :referrals


##  doctors テーブル

| Column                   | Type       | Options     |
| ------------------------ | ---------- | ----------- |
| doctor_name              | string     | null: false |
| specialty_id             | integer    | null: false |


### Association

- has_many :referrals




# アプリケーション名

Support Cube

# アプリケーション概要

このオリジナルアプリは
「患者受入調整をアナログで行う煩わしさ」を解決したい
患者受入れ調整に関わる医療従事者」向けに
患者受入調整状況を一元管理できるアプリです。


# URL



# テスト用アカウント

- メールアドレス：test@sample
- パスワード：111111

# 利用方法

## 


# 機能一覧
・
・
・

# アプリケーションを作成した背景

私は前職で医療機関に勤務しておりました。
患者さんの受診が決定した後のデジタルツールは様々存在し、医療機関同士での連携アプリも増加しています。

ただし、患者さんを受け入れるまでの各種調整の情報を共有し可視化できるデジタルツール(≒機能)が存在していなかったため、今回このアプリを作成しました。



# 実装予定の機能

- 
- 

# 開発環境

- フロントエンド
  - HTML CSS
- バックエンド
  - ruby (v..)
- その他
  - 

# ローカルでの動作方法

以下のコマンドを順に実行  
% git clone https://github.com/kasiaya/supportcube.git 
% cd supportcube  
% yarn  
% yarn dev

# 工夫した点

1 つ目は

2 つ目は