# アプリケーション名

Support Cube

# アプリケーション概要

患者さんの入院受入調整を行ううえで、
重複した事務作業の煩わしさを解決したい医療従事者向けに
受入調整情報を一元管理できるアプリです。


# URL


# テスト用アカウント

- メールアドレス：test@sample
- パスワード：

# 機能一覧
・スタッフ登録希望
・紹介元マスター登録機能
・医師マスター登録機能
・案件登録機能


# 利用方法
・あらかじめスタッフ情報・紹介元マスター・医師マスターの登録を行います。
・受入相談を受けた時点で、案件登録機能を入力します。
・案件の進捗をもとに、判定会議で協議される案件がトップ画面の一覧に表示がされます。
・判定会議で協議後、結果を登録することで受入予定患者が表示され、ベッドの引当を検討することができます。


# アプリケーションを作成した背景

私は前職で医療機関に勤務しておりました。
患者さんの入院受入調整の際に、会議まで紙媒体で案件情報の記入を行なったり、同じ情報を3つ以上のファイルへ登録する作業がありました。（調整中患者の一覧が見えるファイルに入力作業・案件の判定可否を分析するファイルへ入力する作業・カレンダーへ登録する作業・電子カルテへ入力する作業等）

即時に関係者と情報共有ができるツールが存在しておらず、重複する作業を一元化することで、入力作業時間の短縮を行うことに繋がると考え、今回このアプリを作成しました。
(今回は地域包括ケア病棟への受入に特化したシステム設計を行いました。)


# 実装予定の機能
- カレンダー機能
- 検索希望

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

1つ目は、案件登録機能において、電話対応時に聞いた内容をそのまま登録できるようラジオボタンを使用しました。また、enumを使うことによって、作業時間の短縮とともに、コードの可読性を高めました。

2つ目は、案件一覧機能においては、scopeメソッドを使い、会議で必要となる情報を抽出することに取り組みました。


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