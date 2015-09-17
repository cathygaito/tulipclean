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

ActiveRecord::Schema.define(version: 20150917195748) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "orders", force: :cascade do |t|
    t.text     "item",                      default: [],              array: true
    t.integer  "quantity"
    t.integer  "productID"
    t.money    "orderTotal",      scale: 2
    t.string   "shipmentTracker"
    t.boolean  "delivered"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "user_id"
    t.string   "stripeToken"
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "preusers", force: :cascade do |t|
    t.string   "email"
    t.string   "referral_code"
    t.string   "referrer_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "photo"
    t.integer  "sku"
    t.string   "description"
    t.money    "price",       scale: 2
    t.string   "color"
    t.string   "flavor"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "order_id"
  end

  add_index "products", ["order_id"], name: "index_products_on_order_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first"
    t.string   "last"
    t.string   "email"
    t.string   "password_digest"
    t.string   "street"
    t.string   "apt"
    t.string   "city"
    t.string   "zip"
    t.text     "purchases",       default: [],              array: true
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "state"
  end

  add_foreign_key "orders", "users"
  add_foreign_key "products", "orders"
end
