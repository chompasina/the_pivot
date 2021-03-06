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

ActiveRecord::Schema.define(version: 20160803230603) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "creatures", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price"
    t.integer  "type_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.text     "description"
    t.boolean  "retired",     default: false
    t.string   "image_path"
  end

  add_index "creatures", ["type_id"], name: "index_creatures_on_type_id", using: :btree

  create_table "creatures_orders", id: false, force: :cascade do |t|
    t.integer "creature_id", null: false
    t.integer "order_id",    null: false
    t.integer "quantity"
  end

  add_index "creatures_orders", ["creature_id", "order_id"], name: "index_creatures_orders_on_creature_id_and_order_id", using: :btree
  add_index "creatures_orders", ["order_id", "creature_id"], name: "index_creatures_orders_on_order_id_and_creature_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.decimal  "total_price"
    t.integer  "user_id"
    t.string   "status",      default: "awaiting payment"
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "email"
    t.boolean  "admin",           default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_foreign_key "creatures", "types"
  add_foreign_key "orders", "users"
end
