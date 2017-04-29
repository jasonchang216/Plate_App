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

ActiveRecord::Schema.define(version: 20170423165523) do

  create_table "ratings", force: :cascade do |t|
    t.integer  "restaurant_rating",  limit: 4
    t.integer  "restaurant_id",      limit: 4
    t.integer  "user_id",            limit: 4
    t.text     "restaurant_comment", limit: 65535
    t.date     "date_rated"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "ratings", ["restaurant_id"], name: "index_ratings_on_restaurant_id", using: :btree
  add_index "ratings", ["restaurant_rating"], name: "index_ratings_on_restaurant_rating", using: :btree
  add_index "ratings", ["user_id"], name: "index_ratings_on_user_id", using: :btree

  create_table "restaurants", force: :cascade do |t|
    t.string   "restaurant_name", limit: 25
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "restaurants", ["restaurant_name"], name: "index_restaurants_on_restaurant_name", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",        limit: 25
    t.string   "first_name",      limit: 25
    t.string   "last_name",       limit: 25
    t.string   "email",           limit: 255, null: false
    t.string   "password_digest", limit: 255
    t.string   "string",          limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "users", ["username"], name: "index_users_on_username", using: :btree

end
