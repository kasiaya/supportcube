class CreateReferrals < ActiveRecord::Migration[7.0]
  def change
    create_table :referrals do |t|
      t.string     :patient_name     , null: false
      t.integer    :age              , null: false
      t.integer    :gender           , null: false
      t.integer    :history          , null: false
      t.integer    :purpose          , null: false 
      t.string     :adl
      t.integer    :insurance        , null: false 
      t.integer    :prognosis
      t.date       :requested_date
      t.date       :admission_date
      t.integer    :status           , null: false, default: 0
      t.integer    :determination    , null: false, default: 0
      t.text       :memo

      t.references :staff            , null: false, foreign_key: true
      t.references :partner          , null: false, foreign_key: true
      t.references :doctor           , null: false, foreign_key: true

      t.timestamps
    end
  end
end
