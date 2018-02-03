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

ActiveRecord::Schema.define(version: 20180203213525) do

  create_table "badges_sashes", force: :cascade do |t|
    t.integer  "badge_id",      limit: 4
    t.integer  "sash_id",       limit: 4
    t.boolean  "notified_user",           default: false
    t.datetime "created_at"
  end

  add_index "badges_sashes", ["badge_id", "sash_id"], name: "index_badges_sashes_on_badge_id_and_sash_id", using: :btree
  add_index "badges_sashes", ["badge_id"], name: "index_badges_sashes_on_badge_id", using: :btree
  add_index "badges_sashes", ["sash_id"], name: "index_badges_sashes_on_sash_id", using: :btree

  create_table "cities", force: :cascade do |t|
    t.string   "city_name",  limit: 25
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "cities", ["city_name"], name: "index_cities_on_city_name", using: :btree

  create_table "merit_actions", force: :cascade do |t|
    t.integer  "user_id",       limit: 4
    t.string   "action_method", limit: 255
    t.integer  "action_value",  limit: 4
    t.boolean  "had_errors",                  default: false
    t.string   "target_model",  limit: 255
    t.integer  "target_id",     limit: 4
    t.text     "target_data",   limit: 65535
    t.boolean  "processed",                   default: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  create_table "merit_activity_logs", force: :cascade do |t|
    t.integer  "action_id",           limit: 4
    t.string   "related_change_type", limit: 255
    t.integer  "related_change_id",   limit: 4
    t.string   "description",         limit: 255
    t.datetime "created_at"
  end

  create_table "merit_score_points", force: :cascade do |t|
    t.integer  "score_id",   limit: 4
    t.integer  "num_points", limit: 4,   default: 0
    t.string   "log",        limit: 255
    t.datetime "created_at"
  end

  create_table "merit_scores", force: :cascade do |t|
    t.integer "sash_id",  limit: 4
    t.string  "category", limit: 255, default: "default"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "restaurant_rating",  limit: 4
    t.integer  "restaurant_id",      limit: 4
    t.integer  "user_id",            limit: 4
    t.text     "restaurant_comment", limit: 65535
    t.date     "date_rated"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "city_id",            limit: 4
  end

  add_index "ratings", ["city_id"], name: "index_ratings_on_city_id", using: :btree
  add_index "ratings", ["restaurant_id"], name: "index_ratings_on_restaurant_id", using: :btree
  add_index "ratings", ["restaurant_rating"], name: "index_ratings_on_restaurant_rating", using: :btree
  add_index "ratings", ["user_id"], name: "index_ratings_on_user_id", using: :btree

  create_table "restaurants", force: :cascade do |t|
    t.string   "restaurant_name", limit: 25
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "city",            limit: 30
    t.string   "neighborhood",    limit: 100
    t.integer  "city_id",         limit: 4
  end

  add_index "restaurants", ["city_id"], name: "index_restaurants_on_city_id", using: :btree
  add_index "restaurants", ["restaurant_name"], name: "index_restaurants_on_restaurant_name", using: :btree

  create_table "sashes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",        limit: 25
    t.string   "first_name",      limit: 25
    t.string   "last_name",       limit: 25
    t.string   "email",           limit: 255,             null: false
    t.string   "password_digest", limit: 255
    t.string   "string",          limit: 255
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "sash_id",         limit: 4
    t.integer  "level",           limit: 4,   default: 0
  end

  add_index "users", ["username"], name: "index_users_on_username", using: :btree

  add_foreign_key "ratings", "cities"
  add_foreign_key "restaurants", "cities"
end
