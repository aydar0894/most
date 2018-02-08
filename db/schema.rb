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

ActiveRecord::Schema.define(version: 20180208020425) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "doctor_specialities", force: :cascade do |t|
    t.bigint "doctor_id"
    t.bigint "speciality_id"
    t.boolean "is_main"
    t.index ["doctor_id"], name: "index_doctor_specialities_on_doctor_id"
    t.index ["speciality_id"], name: "index_doctor_specialities_on_speciality_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.text "first_name"
    t.text "last_name"
    t.text "middle_name"
    t.datetime "birth_date"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_doctors_on_user_id"
  end

  create_table "event_doctors", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "doctor_id"
    t.integer "status"
    t.index ["doctor_id"], name: "index_event_doctors_on_doctor_id"
    t.index ["event_id"], name: "index_event_doctors_on_event_id"
  end

  create_table "event_operators", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "operator_id"
    t.index ["event_id"], name: "index_event_operators_on_event_id"
    t.index ["operator_id"], name: "index_event_operators_on_operator_id"
  end

  create_table "event_specialities", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "speciality_id"
    t.boolean "is_main"
    t.index ["event_id"], name: "index_event_specialities_on_event_id"
    t.index ["speciality_id"], name: "index_event_specialities_on_speciality_id"
  end

  create_table "events", force: :cascade do |t|
    t.bigint "organizer_id"
    t.text "title"
    t.datetime "start"
    t.datetime "finish"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "reggistrations_count", default: 0
    t.integer "participants_count", default: 0
    t.text "location"
    t.text "description"
    t.integer "max_participants", default: 0
    t.index ["organizer_id"], name: "index_events_on_organizer_id"
  end

  create_table "operators", force: :cascade do |t|
    t.text "first_name"
    t.text "last_name"
    t.text "middle_name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_operators_on_user_id"
  end

  create_table "organizers", force: :cascade do |t|
    t.bigint "user_id"
    t.text "company_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_organizers_on_user_id"
  end

  create_table "specialities", force: :cascade do |t|
    t.text "title"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
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
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "doctor_specialities", "doctors"
  add_foreign_key "doctor_specialities", "specialities"
  add_foreign_key "doctors", "users"
  add_foreign_key "event_doctors", "doctors"
  add_foreign_key "event_doctors", "events"
  add_foreign_key "event_operators", "events"
  add_foreign_key "event_operators", "operators"
  add_foreign_key "event_specialities", "events"
  add_foreign_key "event_specialities", "specialities"
  add_foreign_key "events", "organizers"
  add_foreign_key "operators", "users"
  add_foreign_key "organizers", "users"
end
