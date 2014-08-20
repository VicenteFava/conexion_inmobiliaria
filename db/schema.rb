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

ActiveRecord::Schema.define(version: 20140816153507) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "clients", force: true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "celluar"
    t.string   "optional_phone"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "done_transactions", force: true do |t|
    t.integer  "property_id"
    t.integer  "client_id"
    t.string   "transaction_type"
    t.float    "transaction_price"
    t.date     "transaction_date"
    t.date     "transaction_end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "neighborhoods", force: true do |t|
    t.string   "name"
    t.integer  "properties_count", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", force: true do |t|
    t.integer  "property_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "properties", force: true do |t|
    t.string   "reference"
    t.boolean  "for_sale"
    t.boolean  "for_rent"
    t.boolean  "for_season_rent"
    t.boolean  "for_permutation"
    t.boolean  "visible"
    t.integer  "client_id"
    t.integer  "property_type_id"
    t.integer  "neighborhood_id"
    t.float    "price"
    t.text     "description"
    t.float    "built_up"
    t.float    "lot_size"
    t.integer  "construction_year"
    t.string   "state"
    t.boolean  "living"
    t.boolean  "living_dining"
    t.boolean  "dining"
    t.boolean  "lounge"
    t.boolean  "desk"
    t.boolean  "kitchen"
    t.boolean  "kitchenette"
    t.integer  "suits"
    t.integer  "bedrooms"
    t.integer  "bathrooms"
    t.string   "heating_type"
    t.string   "garage"
    t.float    "common_expenses"
    t.integer  "floor"
    t.string   "elevator"
    t.string   "porter"
    t.string   "recreational_areas"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "principal_photo_file_name"
    t.string   "principal_photo_content_type"
    t.integer  "principal_photo_file_size"
    t.datetime "principal_photo_updated_at"
  end

  create_table "property_types", force: true do |t|
    t.string   "name"
    t.integer  "properties_count", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", force: true do |t|
    t.integer  "client_id"
    t.integer  "admin_user_id"
    t.text     "task"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "visits", force: true do |t|
    t.integer  "property_id"
    t.integer  "client_id"
    t.integer  "admin_user_id"
    t.date     "date"
    t.time     "time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
