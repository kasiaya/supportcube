# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_09_19_054317) do
  create_table "doctors", charset: "utf8", force: :cascade do |t|
    t.string "doctor_name", null: false
    t.integer "specialty_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "partners", charset: "utf8", force: :cascade do |t|
    t.string "institution_name", null: false
    t.integer "institution_category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "referrals", charset: "utf8", force: :cascade do |t|
    t.string "patient_name", null: false
    t.integer "age", null: false
    t.integer "gender", null: false
    t.integer "history", null: false
    t.integer "purpose", null: false
    t.string "adl"
    t.integer "insurance", null: false
    t.string "prognosis"
    t.date "requested_date"
    t.date "admission_date"
    t.integer "status", default: 0, null: false
    t.integer "determination", default: 0, null: false
    t.text "memo"
    t.bigint "staff_id", null: false
    t.bigint "partner_id", null: false
    t.bigint "doctor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_referrals_on_doctor_id"
    t.index ["partner_id"], name: "index_referrals_on_partner_id"
    t.index ["staff_id"], name: "index_referrals_on_staff_id"
  end

  create_table "staffs", charset: "utf8", force: :cascade do |t|
    t.string "employee_id", null: false
    t.string "department", null: false
    t.string "staff_name", null: false
    t.string "staff_name_kana", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_staffs_on_email", unique: true
    t.index ["employee_id"], name: "index_staffs_on_employee_id", unique: true
    t.index ["reset_password_token"], name: "index_staffs_on_reset_password_token", unique: true
  end

  add_foreign_key "referrals", "doctors"
  add_foreign_key "referrals", "partners"
  add_foreign_key "referrals", "staffs"
end
