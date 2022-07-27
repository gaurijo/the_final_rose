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

ActiveRecord::Schema.define(version: 2022_07_27_003120) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bachelorettes", force: :cascade do |t|
    t.string "name"
    t.integer "season_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
  end

  create_table "contestant_outtings", force: :cascade do |t|
    t.bigint "contestant_id"
    t.bigint "outting_id"
    t.index ["contestant_id"], name: "index_contestant_outtings_on_contestant_id"
    t.index ["outting_id"], name: "index_contestant_outtings_on_outting_id"
  end

  create_table "contestants", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "hometown"
    t.bigint "bachelorette_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bachelorette_id"], name: "index_contestants_on_bachelorette_id"
  end

  create_table "outtings", force: :cascade do |t|
    t.string "location"
    t.string "theme"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "contestant_outtings", "contestants"
  add_foreign_key "contestant_outtings", "outtings"
  add_foreign_key "contestants", "bachelorettes"
end
