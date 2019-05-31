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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 2019_05_31_174829) do
=======
ActiveRecord::Schema.define(version: 2019_05_31_172421) do
>>>>>>> afd46bb3294a0bf984deaf23f10c6c8c68a63edf

  create_table "events", force: :cascade do |t|
    t.string "titre"
    t.text "content"
    t.string "location"
    t.date "event_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "creator_id"
<<<<<<< HEAD
    t.index ["creator_id"], name: "index_events_on_creator_id"
=======
>>>>>>> afd46bb3294a0bf984deaf23f10c6c8c68a63edf
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
