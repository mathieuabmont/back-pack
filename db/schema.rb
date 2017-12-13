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

ActiveRecord::Schema.define(version: 20171213154624) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accommodations", force: :cascade do |t|
    t.bigint "step_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category"
    t.string "name"
    t.string "url"
    t.string "location"
    t.string "photo"
    t.text "description"
    t.date "departure_date"
    t.date "arrival_date"
    t.index ["step_id"], name: "index_accommodations_on_step_id"
  end

  create_table "activities", force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.string "photo"
    t.bigint "step_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["step_id"], name: "index_activities_on_step_id"
  end

  create_table "invitations", force: :cascade do |t|
    t.string "email"
    t.string "code"
    t.string "status"
    t.bigint "trip_id"
    t.bigint "invitee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invitee_id"], name: "index_invitations_on_invitee_id"
    t.index ["trip_id"], name: "index_invitations_on_trip_id"
  end

  create_table "itineraries", force: :cascade do |t|
    t.bigint "trip_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_itineraries_on_trip_id"
    t.index ["user_id"], name: "index_itineraries_on_user_id"
  end

  create_table "steps", force: :cascade do |t|
    t.string "title"
    t.bigint "trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.index ["trip_id"], name: "index_steps_on_trip_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.string "photo"
    t.bigint "transport_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["transport_id"], name: "index_tickets_on_transport_id"
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "transports", force: :cascade do |t|
    t.string "departure_location"
    t.string "arrival_location"
    t.bigint "step_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "arrival_time"
    t.string "departure_time"
    t.date "departure_date"
    t.date "arrival_date"
    t.index ["step_id"], name: "index_transports_on_step_id"
  end

  create_table "trips", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
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
    t.string "photo"
    t.string "provider"
    t.string "uid"
    t.string "facebook_picture_url"
    t.string "first_name"
    t.string "last_name"
    t.string "token"
    t.datetime "token_expiry"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "accommodations", "steps"
  add_foreign_key "activities", "steps"
  add_foreign_key "invitations", "itineraries", column: "trip_id"
  add_foreign_key "invitations", "users", column: "invitee_id"
  add_foreign_key "itineraries", "trips"
  add_foreign_key "itineraries", "users"
  add_foreign_key "steps", "trips"
  add_foreign_key "tickets", "transports"
  add_foreign_key "tickets", "users"
  add_foreign_key "transports", "steps"
end
