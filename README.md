# アプリケーション名

Support Cube

# アプリケーション概要

病院における患者さんの入院受け入れ調整情報を、一元管理・可視化する業務工程管理アプリです。
紙媒体や複数のExcelファイルへの重複入力から脱却し、受け入れ調整情報をアプリで一元管理することで、情報の整合性を確保します。
また、可視化機能により各プロセスの進捗状況をリアルタイムで共有できる環境を提供します。


<img width="480px" alt="トップページ" src="https://i.gyazo.com/db9b061ebc480fcf5fa9b9637ca0fb58.png">

# URL
http://43.206.35.125

# テスト用アカウント

- メールアドレス：test@sample
- パスワード：test111

# 機能一覧
- スタッフ登録機能
- 紹介元マスター登録機能
- 医師マスター登録機能
- 案件登録・詳細表示・編集機能
- 担当者別調整案件一覧
- 案件検索機能
- カレンダー表示機能

# 利用方法
- 電話で受入れ相談を受けながら、情報を案件登録画面に入力します。
<img width="480px" alt="案件登録" src="https://i.gyazo.com/c2d74778527be7241fd719bf3283922c.gif">
  
- 案件ごとの「調整状況」をもとに、判定会議で協議予定の案件が抽出され、トップ画面の上部の「判定前」の一覧に表示されます。
<img width="480px" alt="詳細確認" src="https://i.gyazo.com/63cb674a5c790f366d2047bfc9135c54.gif">
  
- 判定会議で協議後、案件詳細情報の「判定結果」を更新することで、トップ画面の下部「判定後」の欄に表示されます。受入予定患者が一覧として表示されることで、全体のバランスを見ながら円滑に病床管理を進めることが可能になります。
<img width="480px" alt="ステータス更新" src="https://i.gyazo.com/f3fb12d7c0405aabc8b4a5ee6f333fa5.gif">

- これまでに相談を受けた案件一覧を確認・検索したい場合は、トップ画面のサイドバーにある「検索」ボタンを押すと、一覧が表示され条件を絞ることが可能です。
<img width="480px" alt="検索機能" src="https://i.gyazo.com/e2dd386cd047b5e5f5283d0d180c153e.gif">

- 受入予定患者の一覧をカレンダー上で確認することも可能です。
<img width="480px" alt="カレンダー" src="https://i.gyazo.com/010a65c614fce1737f36abead5869b94.gif">

# アプリケーションを作成した背景

私は前職で医療機関に勤務しておりました。
患者さんの入院受け入れ調整の際、会議に持参する案件ごとの資料を紙媒体で管理したり、同じ情報を3つ以上のファイルに登録する作業がありました。具体的には、調整中患者の一覧ファイルへの入力、案件の判定可否を分析するファイルへの入力、カレンダーへの登録などです。

即時に関係者と情報共有ができるツールを作ることで、重複する作業を一元化し、作業時間の短縮が可能になると考え、今回このアプリを作成しました。
(今回は地域包括ケア病棟への受入れに特化したシステム設計を行っています。)


# 開発環境

- フロントエンド
  - HTML
  - CSS
- バックエンド
  - Ruby 3.2.0
  - Ruby on Rails 7.0.8.4
- デプロイ環境
  - AWS

# 工夫した点

1つ目は、案件一覧表示機能において、判定前と判定後の案件の抽出情報および表示内容を工夫しました。判定前は調整状況が「聴取中」や「判定待ち」の案件を表示し、判定後は判定結果に応じて「医師判断」「調整中」「調整完了」が選択されている案件を表示します。この仕組みによって、チーム全体の現在進行中の案件がタイムリーに俯瞰でき、より良い選択を促す意思決定支援の仕組みを目指しています。

2つ目は、案件登録機能です。この機能では、電話対応を行いながら即時に情報を登録できるようにラジオボタンを使用しています。案件の進捗に応じて更新が必要な項目には、プルダウンメニューを採用しました。また、ADLや転帰予定先については、案件ごとに個別で詳細な情報や特記事項を記入できる自由記入欄を設けています。

<!-- 
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
- has_many :comments


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
- has_many :comments


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


##  comments テーブル

| Column                   | Type       | Options     |
| ------------------------ | ---------- | ----------- |
| text                     | text       | null: false |

### Association

- belongs_to :staff
- belongs_to :referral

 -->