# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150318230606) do

  create_table "courses", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.integer  "fee"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "courses", ["user_id"], name: "index_courses_on_user_id"

  create_table "fee_payments", force: true do |t|
    t.integer  "course_id"
    t.integer  "user_id"
    t.integer  "student_id"
    t.integer  "institute_id"
    t.integer  "paid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fee_payments", ["course_id"], name: "index_fee_payments_on_course_id"
  add_index "fee_payments", ["institute_id"], name: "index_fee_payments_on_institute_id"
  add_index "fee_payments", ["student_id"], name: "index_fee_payments_on_student_id"
  add_index "fee_payments", ["user_id"], name: "index_fee_payments_on_user_id"

  create_table "institutes", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "institutes", ["user_id"], name: "index_institutes_on_user_id"

  create_table "students", force: true do |t|
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "roll_no"
    t.string   "gender"
    t.date     "birthdate"
    t.text     "address"
    t.text     "mobile"
    t.string   "school"
    t.string   "email"
    t.string   "image"
    t.integer  "institute_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "students", ["institute_id"], name: "index_students_on_institute_id"
  add_index "students", ["user_id"], name: "index_students_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
