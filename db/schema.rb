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

ActiveRecord::Schema.define(version: 20140620031520) do

  create_table "addresses", force: true do |t|
    t.string  "street"
    t.string  "city"
    t.string  "state"
    t.string  "zip"
    t.string  "apt"
    t.integer "person_id"
  end

  create_table "aliases", force: true do |t|
    t.string  "name"
    t.integer "person_id"
  end

  create_table "applicants", force: true do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "applicants", ["user_id"], name: "index_applicants_on_user_id"

  create_table "form_fields", force: true do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "form_fields_housing_forms", id: false, force: true do |t|
    t.integer "form_field_id"
    t.integer "housing_form_id"
  end

  create_table "housing_forms", force: true do |t|
    t.string   "name"
    t.string   "uri"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "location"
    t.float    "lat"
    t.float    "long"
  end

  create_table "people", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "middle_name"
    t.string   "ssn"
    t.datetime "dob"
    t.string   "gender"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "phone"
    t.string   "work_phone"
    t.string   "home_phone"
    t.string   "cell_phone"
    t.string   "citizenship"
    t.string   "nationality"
    t.string   "email"
    t.string   "race"
    t.string   "student_status"
    t.string   "marital_status"
    t.integer  "applicant_id"
    t.string   "occupation"
  end

  create_table "previous_ssns", force: true do |t|
    t.string   "number"
    t.integer  "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relationships", id: false, force: true do |t|
    t.integer "applicant_id", null: false
    t.integer "person_id",    null: false
    t.string  "kind"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
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
