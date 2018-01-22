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

ActiveRecord::Schema.define(version: 20180105135431) do

  create_table "companies", force: :cascade do |t|
    t.string "c_name"
    t.string "c_email"
    t.string "c_url"
    t.string "c_tel"
    t.string "c_industry"
    t.string "c_place"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "c_password"
    t.string "image"
    t.string "c_content"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "s_name"
    t.string "s_email"
    t.string "s_school"
    t.string "s_password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "s_grade"
    t.string "image"
    t.string "pdf"
    t.string "s_live_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
