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

ActiveRecord::Schema.define(version: 20151010210503) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "businesses", force: :cascade do |t|
    t.string   "business_id",                null: false
    t.string   "name"
    t.string   "full_address"
    t.string   "city"
    t.string   "state"
    t.float    "longitude"
    t.float    "latitude"
    t.decimal  "stars"
    t.integer  "review_counts"
    t.string   "neighborhoods", default: [],              array: true
    t.json     "attributes",    default: {}
    t.boolean  "open"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "businesses", ["business_id"], name: "index_businesses_on_business_id", unique: true, using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "business_id"
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "categories", ["business_id"], name: "index_categories_on_business_id", using: :btree

  create_table "checkins", force: :cascade do |t|
    t.string   "business_id"
    t.json     "info",        default: {}
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "checkins", ["business_id"], name: "index_checkins_on_business_id", using: :btree

  create_table "friendships", force: :cascade do |t|
    t.string   "user_id"
    t.string   "friend_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "friendships", ["friend_id"], name: "index_friendships_on_friend_id", using: :btree
  add_index "friendships", ["user_id"], name: "index_friendships_on_user_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.string   "review_id",                null: false
    t.string   "user_id"
    t.string   "business_id"
    t.text     "text"
    t.date     "date"
    t.integer  "stars"
    t.json     "votes",       default: {}
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "reviews", ["business_id"], name: "index_reviews_on_business_id", using: :btree
  add_index "reviews", ["review_id"], name: "index_reviews_on_review_id", unique: true, using: :btree
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

  create_table "schedules", force: :cascade do |t|
    t.string   "business_id"
    t.time     "mo_open"
    t.time     "mo_close"
    t.time     "tu_open"
    t.time     "tu_close"
    t.time     "we_open"
    t.time     "we_close"
    t.time     "th_open"
    t.time     "th_close"
    t.time     "fr_open"
    t.time     "fr_close"
    t.time     "sa_open"
    t.time     "sa_close"
    t.time     "su_open"
    t.time     "su_close"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "schedules", ["business_id"], name: "index_schedules_on_business_id", using: :btree

  create_table "tips", force: :cascade do |t|
    t.string   "user_id"
    t.string   "business_id"
    t.integer  "likes"
    t.date     "date"
    t.text     "text"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "tips", ["business_id"], name: "index_tips_on_business_id", using: :btree
  add_index "tips", ["user_id"], name: "index_tips_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "user_id",                    null: false
    t.string   "name"
    t.date     "yelping_since"
    t.integer  "review_count"
    t.float    "average_stars"
    t.integer  "fans"
    t.json     "votes",         default: {}
    t.json     "compliments",   default: {}
    t.integer  "elite",         default: [],              array: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["user_id"], name: "index_users_on_user_id", unique: true, using: :btree

end
