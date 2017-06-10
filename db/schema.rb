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

ActiveRecord::Schema.define(version: 2017_05_27_085029) do

  create_table "addresses", force: :cascade do |t|
    t.integer "user_id"
    t.string "purpose"
    t.string "address_line_1"
    t.string "address_line_2"
    t.string "landmark"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "pincode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "resource_type"
    t.integer "resource_id"
    t.string "purpose"
    t.string "name"
    t.string "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resource_type", "resource_id"], name: "index_contacts_on_resource_type_and_resource_id"
  end

  create_table "events", force: :cascade do |t|
    t.integer "venue_id"
    t.string "title"
    t.datetime "start_time"
    t.datetime "end_time"
    t.text "event_leaders"
    t.string "status"
    t.text "short_description"
    t.text "description"
    t.text "attractions"
    t.integer "cost"
    t.text "inclusions"
    t.text "exclusions"
    t.text "things_to_carry"
    t.text "payment_details"
    t.text "itinerary"
    t.string "assembly_point"
    t.datetime "assembly_time"
    t.text "contact_details"
    t.text "disclaimer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["venue_id"], name: "index_events_on_venue_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.integer "user_id"
    t.string "first_name"
    t.string "last_name"
    t.datetime "membership_started_on"
    t.text "social_links"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "routes", force: :cascade do |t|
    t.integer "venue_id"
    t.string "name"
    t.string "start_point"
    t.string "via"
    t.string "end_point"
    t.text "description"
    t.integer "distance"
    t.text "modes_of_transport"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["venue_id"], name: "index_routes_on_venue_id"
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
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0
    t.string "username"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  create_table "venues", force: :cascade do |t|
    t.string "name"
    t.string "purpose"
    t.string "grade"
    t.string "region"
    t.text "description"
    t.text "attractions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
