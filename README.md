# テーブル設計

## staffs テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| employeeID         | string | null: false, unique: true  |
| department         | string | null: false |
| staff_name         | string | null: false |
| staff_name_kana    | string | null: false |
| encrypted_password | string | null: false |


### Association

- has_many :cases
- has_many :actions


## cases テーブル

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
| case               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :case



# アプリケーション名

Support Cube

# アプリケーション概要



# URL



# テスト用アカウント

- ID：00001111
- パスワード：test1test1

# 利用方法

## 


# 機能一覧



# アプリケーションを作成した背景


# 実装予定の機能

- 
- 

# 開発環境

- フロントエンド
  - 
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