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

ActiveRecord::Schema.define(version: 20170209203709) do

  create_table "api_keys", force: :cascade do |t|
    t.string   "access_token",             null: false
    t.integer  "user_id"
    t.integer  "status",       default: 1, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["access_token"], name: "index_api_keys_on_access_token", unique: true
    t.index ["status"], name: "index_api_keys_on_status"
    t.index ["user_id"], name: "index_api_keys_on_user_id"
  end

  create_table "geolocations", force: :cascade do |t|
    t.float    "latitude",   null: false
    t.float    "longitude",  null: false
    t.datetime "fetch_time", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "special_users", force: :cascade do |t|
    t.integer "user_id",         null: false
    t.integer "related_user_id", null: false
    t.boolean "disguising",      null: false
    t.index ["related_user_id"], name: "index_special_users_on_related_user_id"
    t.index ["user_id"], name: "index_special_users_on_user_id"
  end

  create_table "special_users_geolocations", id: false, force: :cascade do |t|
    t.integer "special_user_id", null: false
    t.integer "geolocation_id",  null: false
    t.index ["geolocation_id"], name: "index_special_users_geolocations_on_geolocation_id"
    t.index ["special_user_id"], name: "index_special_users_geolocations_on_special_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "uuid",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.index ["uuid"], name: "index_users_on_uuid", unique: true
  end

  create_table "users_geolocations", id: false, force: :cascade do |t|
    t.integer "user_id",        null: false
    t.integer "geolocation_id", null: false
    t.index ["geolocation_id"], name: "index_users_geolocations_on_geolocation_id"
    t.index ["user_id"], name: "index_users_geolocations_on_user_id"
  end

end
