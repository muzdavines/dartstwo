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

ActiveRecord::Schema.define(version: 20170815031800) do

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

  create_table "trades", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "transDirection", limit: 50
    t.string "iso", limit: 10
    t.string "loc", limit: 10
    t.string "settlement", limit: 30
    t.string "product", limit: 30
    t.date "start_date"
    t.date "end_date"
    t.string "mw_peak", limit: 30
    t.string "mw_wrap", limit: 30
    t.float "price_peak"
    t.float "price_wrap"
    t.integer "term"
    t.integer "offerer_id"
    t.integer "offeree_id"
    t.string "offerer_email"
    t.string "offeree_email"
  end

  create_table "trades_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "trade_id"
    t.index ["user_id", "trade_id"], name: "index_trades_users_on_user_id_and_trade_id"
  end

  create_table "tradeviews", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
