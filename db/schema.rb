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

ActiveRecord::Schema.define(version: 20151002021129) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendees", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_day_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "dirty",        default: 0, null: false
    t.text     "notes"
  end

  add_index "attendees", ["event_day_id", "user_id"], name: "index_attendees_on_event_day_id_and_user_id", using: :btree
  add_index "attendees", ["user_id", "event_day_id"], name: "index_attendees_on_user_id_and_event_day_id", using: :btree

  create_table "campaigns", force: :cascade do |t|
    t.integer  "rwu_id"
    t.integer  "candidate_id"
    t.integer  "election_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "dirty",        default: 0, null: false
    t.string   "official_url"
  end

  add_index "campaigns", ["candidate_id"], name: "index_campaigns_on_candidate_id", using: :btree
  add_index "campaigns", ["election_id"], name: "index_campaigns_on_election_id", using: :btree
  add_index "campaigns", ["rwu_id"], name: "index_campaigns_on_rwu_id", using: :btree

  create_table "candidates", force: :cascade do |t|
    t.integer  "rwu_id"
    t.integer  "person_id"
    t.string   "office_id"
    t.string   "position"
    t.string   "district"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "dirty",       default: 0, null: false
    t.string   "party"
    t.string   "status"
    t.text     "description"
  end

  add_index "candidates", ["person_id"], name: "index_candidates_on_person_id", using: :btree
  add_index "candidates", ["rwu_id"], name: "index_candidates_on_rwu_id", using: :btree

  create_table "candidates_events", id: false, force: :cascade do |t|
    t.integer "candidate_id", null: false
    t.integer "event_id",     null: false
  end

  add_index "candidates_events", ["candidate_id", "event_id"], name: "index_candidates_events_on_candidate_id_and_event_id", using: :btree
  add_index "candidates_events", ["event_id", "candidate_id"], name: "index_candidates_events_on_event_id_and_candidate_id", using: :btree

  create_table "elections", force: :cascade do |t|
    t.integer  "rwu_id"
    t.string   "name"
    t.string   "state"
    t.string   "office_type_id"
    t.boolean  "special"
    t.integer  "election_year"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "dirty",          default: 0, null: false
  end

  add_index "elections", ["rwu_id"], name: "index_elections_on_rwu_id", using: :btree

  create_table "event_days", force: :cascade do |t|
    t.integer  "rwu_id"
    t.integer  "event_id"
    t.datetime "date"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "dirty",      default: 0, null: false
  end

  add_index "event_days", ["event_id"], name: "index_event_days_on_event_id", using: :btree
  add_index "event_days", ["rwu_id"], name: "index_event_days_on_rwu_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.integer  "rwu_id"
    t.string   "title"
    t.string   "description"
    t.integer  "venue_id"
    t.boolean  "public"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "dirty",        default: 0, null: false
    t.string   "official_url"
  end

  add_index "events", ["rwu_id"], name: "index_events_on_rwu_id", using: :btree
  add_index "events", ["venue_id"], name: "index_events_on_venue_id", using: :btree

  create_table "events_people", id: false, force: :cascade do |t|
    t.integer "event_id",  null: false
    t.integer "person_id", null: false
  end

  add_index "events_people", ["event_id", "person_id"], name: "index_events_people_on_event_id_and_person_id", using: :btree
  add_index "events_people", ["person_id", "event_id"], name: "index_events_people_on_person_id_and_event_id", using: :btree

  create_table "people", force: :cascade do |t|
    t.integer  "rwu_id"
    t.string   "first_name"
    t.string   "nickname"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "suffix"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "dirty",       default: 0, null: false
    t.string   "image_url"
    t.string   "title"
  end

  add_index "people", ["rwu_id"], name: "index_people_on_rwu_id", using: :btree

  create_table "statements", force: :cascade do |t|
    t.integer  "rwu_id"
    t.integer  "user_id"
    t.integer  "event_day_id"
    t.integer  "campaign_id"
    t.integer  "candidate_id"
    t.string   "title"
    t.string   "url"
    t.text     "description"
    t.boolean  "approved"
    t.string   "ugc_candidate_name"
    t.datetime "ugc_date"
    t.string   "ugc_event_title"
    t.string   "ugc_event_location"
    t.text     "ugc_notes"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "dirty",              default: 0, null: false
    t.string   "youtube_url"
    t.string   "third_party_url"
  end

  add_index "statements", ["campaign_id"], name: "index_statements_on_campaign_id", using: :btree
  add_index "statements", ["candidate_id"], name: "index_statements_on_candidate_id", using: :btree
  add_index "statements", ["event_day_id"], name: "index_statements_on_event_day_id", using: :btree
  add_index "statements", ["rwu_id"], name: "index_statements_on_rwu_id", using: :btree
  add_index "statements", ["user_id"], name: "index_statements_on_user_id", using: :btree

  create_table "statements_tags", force: :cascade do |t|
    t.integer "tag_id",       null: false
    t.integer "statement_id", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "location"
    t.string   "fb_uid"
    t.string   "fb_token"
    t.boolean  "admin"
    t.string   "postal_code"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "dirty",        default: 0,  null: false
    t.float    "latitude"
    t.float    "longitude"
    t.string   "name",         default: ""
    t.string   "provider",     default: ""
    t.string   "gender",       default: ""
    t.string   "utc_offset",   default: ""
    t.string   "url",          default: ""
    t.string   "photo",        default: ""
    t.string   "mobile_phone"
  end

  create_table "venues", force: :cascade do |t|
    t.integer  "rwu_id"
    t.string   "name"
    t.string   "street_address1"
    t.string   "street_address2"
    t.string   "unit"
    t.string   "city"
    t.string   "state"
    t.string   "postal_code"
    t.string   "url"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "dirty",           default: 0, null: false
  end

  add_index "venues", ["rwu_id"], name: "index_venues_on_rwu_id", using: :btree

end
