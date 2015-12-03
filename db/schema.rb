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

ActiveRecord::Schema.define(version: 20151203173209) do

  create_table "feedbacks", force: :cascade do |t|
    t.string   "company"
    t.integer  "creator_id"
    t.integer  "team_id"
    t.string   "milestone"
    t.integer  "q1"
    t.integer  "q2"
    t.integer  "q3"
    t.integer  "q4"
    t.integer  "q5"
    t.integer  "q6"
    t.integer  "q7"
    t.integer  "q8"
    t.integer  "q9"
    t.integer  "q10"
    t.integer  "q11"
    t.text     "oeq1"
    t.text     "oeq2"
    t.text     "oeq3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "group_evals", force: :cascade do |t|
    t.text     "questions"
    t.integer  "presentation"
    t.integer  "answering"
    t.integer  "contribution"
    t.text     "strength"
    t.text     "weakness"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "creator_id"
    t.string   "milestone"
    t.integer  "team_id"
  end

  create_table "peer_evals", force: :cascade do |t|
    t.string   "milestone"
    t.integer  "goals"
    t.integer  "quality"
    t.integer  "effort"
    t.integer  "considerate"
    t.integer  "knowledge"
    t.integer  "sharing"
    t.string   "strength"
    t.string   "weakness"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.integer  "creator_id"
  end

  create_table "students", force: :cascade do |t|
    t.string   "last_name"
    t.string   "first_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "last_name"
    t.string   "first_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                  default: false, null: false
    t.integer  "team_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
