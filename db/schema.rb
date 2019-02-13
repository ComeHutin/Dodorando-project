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

ActiveRecord::Schema.define(version: 2018_12_14_101545) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bed2s", force: :cascade do |t|
    t.bigint "room_id"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_bed2s_on_room_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.date "check_in"
    t.date "check_out"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "order_id"
    t.index ["order_id"], name: "index_bookings_on_order_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.string "place"
    t.string "distance_next"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dormitory_beds", force: :cascade do |t|
    t.bigint "user_id"
    t.string "price"
    t.integer "empty_full"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "date_full"
    t.string "date_et_id", default: [], array: true
    t.bigint "dormitory_room_id"
    t.index ["dormitory_room_id"], name: "index_dormitory_beds_on_dormitory_room_id"
    t.index ["user_id"], name: "index_dormitory_beds_on_user_id"
  end

  create_table "dormitory_rooms", force: :cascade do |t|
    t.bigint "house_id"
    t.integer "number_of_beds"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "date_full"
    t.bigint "bed2_id"
    t.index ["bed2_id"], name: "index_dormitory_rooms_on_bed2_id"
    t.index ["house_id"], name: "index_dormitory_rooms_on_house_id"
  end

  create_table "free_rooms", force: :cascade do |t|
    t.integer "number_of_the_room"
    t.string "name_of_the_room"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "room_type_id"
    t.bigint "house_id"
    t.float "price_of_the_night"
    t.index ["house_id"], name: "index_free_rooms_on_house_id"
    t.index ["room_type_id"], name: "index_free_rooms_on_room_type_id"
  end

  create_table "hosteds", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "occupied_room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["occupied_room_id"], name: "index_hosteds_on_occupied_room_id"
    t.index ["user_id"], name: "index_hosteds_on_user_id"
  end

  create_table "houses", force: :cascade do |t|
    t.bigint "city_id"
    t.string "name"
    t.text "description"
    t.integer "number_of_rooms"
    t.integer "empty_full"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "number_of_dormitory_rooms"
    t.index ["city_id"], name: "index_houses_on_city_id"
  end

  create_table "occupied_rooms", force: :cascade do |t|
    t.bigint "booking_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "free_room_id"
    t.index ["booking_id"], name: "index_occupied_rooms_on_booking_id"
    t.index ["free_room_id"], name: "index_occupied_rooms_on_free_room_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "total_price"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "paniers", force: :cascade do |t|
    t.string "params_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "date_in"
    t.string "date_out"
    t.string "room_type1_nb"
    t.string "room_type2_nb"
    t.string "room_type3_nb"
    t.string "room_type4_nb"
    t.string "person_type2_nb"
    t.string "person_type4_nb"
  end

  create_table "room_types", force: :cascade do |t|
    t.string "description"
    t.integer "capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sleeping_rooms", force: :cascade do |t|
    t.bigint "house_id"
    t.string "price"
    t.integer "number_max"
    t.integer "number_wanted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.datetime "date_full"
    t.string "date_et_id", default: [], array: true
    t.index ["house_id"], name: "index_sleeping_rooms_on_house_id"
    t.index ["user_id"], name: "index_sleeping_rooms_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "facebook_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "orders"
  add_foreign_key "free_rooms", "houses"
  add_foreign_key "free_rooms", "room_types"
  add_foreign_key "hosteds", "occupied_rooms"
  add_foreign_key "hosteds", "users"
  add_foreign_key "occupied_rooms", "bookings"
  add_foreign_key "occupied_rooms", "free_rooms"
  add_foreign_key "orders", "users"
  add_foreign_key "sleeping_rooms", "users"
end
