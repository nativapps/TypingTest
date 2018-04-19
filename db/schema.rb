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

ActiveRecord::Schema.define(version: 2018_04_18_200524) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bank_tests", force: :cascade do |t|
    t.string "name"
    t.string "type_test"
    t.text "text_test"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "has_participants", force: :cascade do |t|
    t.bigint "room_id"
    t.bigint "participant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["participant_id"], name: "index_has_participants_on_participant_id"
    t.index ["room_id"], name: "index_has_participants_on_room_id"
  end

  create_table "participants", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_participants_on_email", unique: true
    t.index ["reset_password_token"], name: "index_participants_on_reset_password_token", unique: true
  end

  create_table "participants_rooms", force: :cascade do |t|
    t.bigint "room_id"
    t.bigint "participant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["participant_id"], name: "index_participants_rooms_on_participant_id"
    t.index ["room_id"], name: "index_participants_rooms_on_room_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.date "start_date"
    t.date "finish_date"
    t.integer "tried_times"
    t.string "set_limit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "test_banks", force: :cascade do |t|
    t.string "name"
    t.string "type_test"
    t.text "text_test"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.boolean "is_admin", default: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "has_participants", "participants"
  add_foreign_key "has_participants", "rooms"
  add_foreign_key "participants_rooms", "participants"
  add_foreign_key "participants_rooms", "rooms"
end
