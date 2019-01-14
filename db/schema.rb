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

ActiveRecord::Schema.define(version: 2019_01_08_032447) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "collections", force: :cascade do |t|
    t.bigint "station_id"
    t.bigint "equipment_id"
    t.datetime "day"
    t.float "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["equipment_id"], name: "index_collections_on_equipment_id"
    t.index ["station_id", "equipment_id", "day"], name: "index_collections_on_station_id_and_equipment_id_and_day", unique: true
    t.index ["station_id"], name: "index_collections_on_station_id"
  end

  create_table "equipment", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hourly_collections", force: :cascade do |t|
    t.bigint "collection_id"
    t.integer "hour"
    t.float "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["collection_id"], name: "index_hourly_collections_on_collection_id"
  end

  create_table "macroregions", force: :cascade do |t|
    t.bigint "state_id"
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_macroregions_on_state_id"
  end

  create_table "microregions", force: :cascade do |t|
    t.bigint "macroregion_id"
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["macroregion_id"], name: "index_microregions_on_macroregion_id"
  end

  create_table "states", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stations", force: :cascade do |t|
    t.bigint "microregion_id"
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["microregion_id"], name: "index_stations_on_microregion_id"
  end

  add_foreign_key "collections", "equipment"
  add_foreign_key "collections", "stations"
  add_foreign_key "hourly_collections", "collections"
  add_foreign_key "macroregions", "states"
  add_foreign_key "microregions", "macroregions"
  add_foreign_key "stations", "microregions"
end
