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

ActiveRecord::Schema.define(version: 20170508223316) do

  create_table "devices", force: true do |t|
    t.string   "device_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "test_data", force: true do |t|
    t.integer  "device_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "test_data", ["device_id"], name: "index_test_data_on_device_id", using: :btree

  create_table "test_data_options", force: true do |t|
    t.integer  "test_data_id"
    t.string   "name"
    t.boolean  "high"
    t.boolean  "medium"
    t.boolean  "low"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "test_data_options", ["test_data_id"], name: "index_test_data_options_on_test_data_id", using: :btree

  create_table "testdata", id: false, force: true do |t|
    t.string "Light",         limit: 25
    t.string "Health",        limit: 25
    t.string "Heating",       limit: 25
    t.string "Safety",        limit: 25
    t.string "HomeSecurity",  limit: 25
    t.string "Entertainment", limit: 25
  end

  create_table "user_preferences", force: true do |t|
    t.integer  "device_id"
    t.string   "Health"
    t.string   "Light"
    t.string   "Heating"
    t.string   "Safety"
    t.string   "Security"
    t.string   "Entertainment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_preferences", ["device_id"], name: "index_user_preferences_on_device_id", using: :btree

end
