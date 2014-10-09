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

ActiveRecord::Schema.define(version: 20141007202026) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "stadiums", force: true do |t|
    t.string  "name",            null: false
    t.string  "city",            null: false
    t.string  "state",           null: false
    t.integer "capacity",        null: false
    t.string  "playing_surface", null: false
    t.string  "roof_type",       null: false
    t.string  "team",            null: false
    t.string  "photo"
    t.string  "seating_chart"
    t.text    "description"
    t.integer "year",            null: false
  end

  create_table "trips", force: true do |t|
    t.integer  "user_id",    null: false
    t.integer  "stadium_id", null: false
    t.text     "summary",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "trips", ["stadium_id"], name: "index_trips_on_stadium_id", using: :btree
  add_index "trips", ["user_id"], name: "index_trips_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",       null: false
    t.string   "encrypted_password",     default: "",       null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "username",                                  null: false
    t.string   "profile_photo"
    t.string   "role",                   default: "member", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
