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

ActiveRecord::Schema.define(version: 20160619084634) do

  create_table "admins", force: :cascade do |t|
    t.string   "email",           limit: 255
    t.string   "password_digest", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "name",            limit: 255
  end

  create_table "advertisings", force: :cascade do |t|
    t.string   "image",      limit: 255
    t.string   "link",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "marker_id",  limit: 4
    t.boolean  "enabled"
  end

  add_index "advertisings", ["marker_id"], name: "fk_rails_4d5226afb6", using: :btree

  create_table "apps", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "memo",       limit: 255
  end

  create_table "apps_companies", force: :cascade do |t|
    t.integer  "app_id",     limit: 4
    t.integer  "company_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "apps_companies", ["app_id"], name: "index_apps_companies_on_app_id", using: :btree
  add_index "apps_companies", ["company_id"], name: "index_apps_companies_on_company_id", using: :btree

  create_table "characters", force: :cascade do |t|
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "name",       limit: 255
    t.string   "thumbnail",  limit: 255
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.boolean  "enabled"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "character_id", limit: 4
  end

  add_index "companies", ["character_id"], name: "index_companies_on_character_id", using: :btree

  create_table "impressions", force: :cascade do |t|
    t.integer  "advertising_id", limit: 4
    t.integer  "user_id",        limit: 4
    t.float    "latitude",       limit: 24
    t.float    "longitude",      limit: 24
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.datetime "displayed_at"
  end

  add_index "impressions", ["advertising_id"], name: "index_impressions_on_advertising_id", using: :btree
  add_index "impressions", ["user_id"], name: "index_impressions_on_user_id", using: :btree

  create_table "markers", force: :cascade do |t|
    t.integer  "company_id", limit: 4
    t.string   "image",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.boolean  "enabled"
    t.string   "target_id",  limit: 255
    t.string   "name",       limit: 255
  end

  add_index "markers", ["company_id"], name: "index_markers_on_company_id", using: :btree
  add_index "markers", ["name"], name: "index_markers_on_name", unique: true, using: :btree

  create_table "reaches", force: :cascade do |t|
    t.integer  "advertising_id", limit: 4
    t.integer  "user_id",        limit: 4
    t.float    "latitude",       limit: 24
    t.float    "longitude",      limit: 24
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.datetime "displayed_at"
  end

  add_index "reaches", ["advertising_id"], name: "index_reaches_on_advertising_id", using: :btree
  add_index "reaches", ["user_id"], name: "index_reaches_on_user_id", using: :btree

  create_table "staffs", force: :cascade do |t|
    t.integer  "company_id",      limit: 4
    t.string   "email",           limit: 255
    t.string   "password_digest", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "name",            limit: 255
  end

  add_index "staffs", ["company_id"], name: "index_staffs_on_company_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "uuid",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_foreign_key "advertisings", "markers"
  add_foreign_key "apps_companies", "apps"
  add_foreign_key "apps_companies", "companies"
  add_foreign_key "impressions", "advertisings"
  add_foreign_key "impressions", "users"
  add_foreign_key "markers", "companies"
  add_foreign_key "reaches", "advertisings"
  add_foreign_key "reaches", "users"
  add_foreign_key "staffs", "companies"
end
