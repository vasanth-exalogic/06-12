# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_12_04_035920) do

  create_table "details", force: :cascade do |t|
    t.string "fname"
    t.string "lname"
    t.date "dob"
    t.date "doj"
    t.string "bloodtype"
    t.string "contact"
    t.string "gender"
    t.text "address"
    t.string "state"
    t.string "city"
    t.string "country"
    t.string "pincode"
    t.string "ename"
    t.string "econtact"
    t.string "pskill"
    t.string "sskill1"
    t.string "sskill2"
    t.integer "notice"
    t.string "relation"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user"
  end

  create_table "pays", force: :cascade do |t|
    t.decimal "basic", default: "0.0"
    t.decimal "hra", default: "0.0"
    t.decimal "cca", default: "0.0"
    t.decimal "spl_all", default: "0.0"
    t.decimal "trans_all", default: "0.0"
    t.decimal "reimb", default: "0.0"
    t.decimal "i_tax", default: "0.0"
    t.decimal "p_tax", default: "0.0"
    t.decimal "lop", default: "0.0"
    t.decimal "deduction", default: "0.0"
    t.decimal "gross", default: "0.0"
    t.decimal "net", default: "0.0"
    t.decimal "ctc", default: "0.0"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "days"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "role"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
