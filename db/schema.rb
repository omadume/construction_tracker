# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_04_25_155216) do
  create_table "buildings", force: :cascade do |t|
    t.string "name"
    t.decimal "budget"
    t.decimal "total_expenditure", default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "daily_snapshots", force: :cascade do |t|
    t.integer "building_id", null: false
    t.date "date"
    t.decimal "total_expenditure"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "room_data"
    t.index ["building_id"], name: "index_daily_snapshots_on_building_id"
  end

  create_table "elements", force: :cascade do |t|
    t.integer "room_id"
    t.string "name"
    t.decimal "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_elements_on_room_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.integer "building_id", null: false
    t.string "name"
    t.decimal "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "not started"
    t.index ["building_id"], name: "index_rooms_on_building_id"
  end

  add_foreign_key "daily_snapshots", "buildings"
  add_foreign_key "elements", "rooms"
  add_foreign_key "rooms", "buildings"
end
