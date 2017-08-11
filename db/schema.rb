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

ActiveRecord::Schema.define(version: 20170802224542) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "darters", force: :cascade do |t|
    t.integer "player_id"
    t.string "name"
    t.integer "seed"
    t.boolean "alive"
    t.integer "rounds"
    t.integer "total_points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_darters_on_player_id"
  end

  create_table "players", force: :cascade do |t|
    t.integer "tournament_id"
    t.string "name"
    t.integer "total_points", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tournament_id"], name: "index_players_on_tournament_id"
  end

  create_table "rounds", force: :cascade do |t|
    t.integer "darter_id"
    t.boolean "champion", default: false
    t.boolean "win", default: false
    t.integer "180", default: 0
    t.integer "140", default: 0
    t.integer "170", default: 0
    t.integer "ton_plus", default: 0
    t.integer "9_dart", default: 0
    t.integer "legs", default: 0
    t.integer "score", default: 0
    t.string "name", default: "Round 1"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "roundName", limit: 25
    t.index ["darter_id"], name: "index_rounds_on_darter_id"
  end

  create_table "tournaments", force: :cascade do |t|
    t.string "name"
    t.date "date"
    t.string "fantasy_winner"
    t.string "darts_winner"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
