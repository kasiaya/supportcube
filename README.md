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
- has_many :actions


## referrals テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| patient_name       | string     | null: false |
| birth_date         | date       | null: false |
| gender_id          | integer    | null: false |
| history_id         | integer    | null: false |
| purpose_id         | integer    | null: false |
| adl_id             | integer    | null: false |
| insurance_id       | integer    | null: false |
| timing             | integer    | null: false |
| key_person         | integer    | null: false |
| destination_id     | integer    |             |
| status_id          | string     | null: false |
| user               | references | null: false, foreign_key: true |
| action             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one : action


## actions テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| decision_id        | integer    | null: false |
| comment            | text       |             |
| admission_date     | date       | null: false |
| dr_id              | integer    | null: false |
| referral               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :referral



# アプリケーション名

Support Cube

# アプリケーション概要

このオリジナルアプリは
「患者受入調整をアナログで行う煩わしさ」を解決したい
「関わる医療従事者」向けに患者受入調整状況を
即座に共有できるアプリです。


# URL



# テスト用アカウント

- ID：00001111
- パスワード：test1test1

# 利用方法

## 


# 機能一覧
・
・
・

# アプリケーションを作成した背景

私は前職で医療機関に勤務しておりました。患者さんの受診が決定した後のデジタルツールは様々存在します。また医療機関同士での連携アプリも増加しています。

ただし、入院を受け入れるまでの調整の情報共有を、可視化できるデジタルツール(≒機能)が存在していなかったため、今回このアプリを作成しました。



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