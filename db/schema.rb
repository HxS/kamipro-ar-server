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

ActiveRecord::Schema.define(version: 20160505010439) do

  create_table "admins", force: :cascade do |t|
    t.string   "email",           limit: 255
    t.string   "password_digest", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "advertisings", force: :cascade do |t|
    t.string   "image_url",  limit: 255
    t.string   "link_url",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "company_id", limit: 4
  end

  add_index "advertisings", ["company_id"], name: "index_advertisings_on_company_id", using: :btree

  create_table "apps", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
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
    t.string   "asset_url",     limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "name",          limit: 255
    t.string   "thumbnail_url", limit: 255
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.boolean  "disabled"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "companies_characters", force: :cascade do |t|
    t.integer  "company_id",   limit: 4
    t.integer  "character_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "companies_characters", ["character_id"], name: "index_companies_characters_on_character_id", using: :btree
  add_index "companies_characters", ["company_id"], name: "index_companies_characters_on_company_id", using: :btree

  create_table "impressions", force: :cascade do |t|
    t.integer  "marker_id",      limit: 4
    t.integer  "character_id",   limit: 4
    t.integer  "advertising_id", limit: 4
    t.integer  "user_id",        limit: 4
    t.float    "latitude",       limit: 24
    t.float    "longitude",      limit: 24
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.datetime "displayed_at"
  end

  add_index "impressions", ["advertising_id"], name: "index_impressions_on_advertising_id", using: :btree
  add_index "impressions", ["character_id"], name: "index_impressions_on_character_id", using: :btree
  add_index "impressions", ["marker_id"], name: "index_impressions_on_marker_id", using: :btree
  add_index "impressions", ["user_id"], name: "index_impressions_on_user_id", using: :btree

  create_table "markers", force: :cascade do |t|
    t.integer  "company_id", limit: 4
    t.string   "image_url",  limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "markers", ["company_id"], name: "index_markers_on_company_id", using: :btree

  create_table "reaches", force: :cascade do |t|
    t.integer  "marker_id",      limit: 4
    t.integer  "character_id",   limit: 4
    t.integer  "advertising_id", limit: 4
    t.integer  "user_id",        limit: 4
    t.float    "latitude",       limit: 24
    t.float    "longitude",      limit: 24
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.datetime "displayed_at"
  end

  add_index "reaches", ["advertising_id"], name: "index_reaches_on_advertising_id", using: :btree
  add_index "reaches", ["character_id"], name: "index_reaches_on_character_id", using: :btree
  add_index "reaches", ["marker_id"], name: "index_reaches_on_marker_id", using: :btree
  add_index "reaches", ["user_id"], name: "index_reaches_on_user_id", using: :btree

  create_table "staffs", force: :cascade do |t|
    t.integer  "company_id",      limit: 4
    t.string   "email",           limit: 255
    t.string   "password_digest", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "staffs", ["company_id"], name: "index_staffs_on_company_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "uuid",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_foreign_key "advertisings", "companies"
  add_foreign_key "apps_companies", "apps"
  add_foreign_key "apps_companies", "companies"
  add_foreign_key "companies_characters", "characters"
  add_foreign_key "companies_characters", "companies"
  add_foreign_key "impressions", "advertisings"
  add_foreign_key "impressions", "characters"
  add_foreign_key "impressions", "markers"
  add_foreign_key "impressions", "users"
  add_foreign_key "markers", "companies"
  add_foreign_key "reaches", "advertisings"
  add_foreign_key "reaches", "characters"
  add_foreign_key "reaches", "markers"
  add_foreign_key "reaches", "users"
  add_foreign_key "staffs", "companies"
end
