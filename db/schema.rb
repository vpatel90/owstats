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

ActiveRecord::Schema.define(version: 20160610154731) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "best_games", force: :cascade do |t|
    t.integer  "player_hero_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "best_games", ["player_hero_id"], name: "index_best_games_on_player_hero_id", using: :btree

  create_table "best_lives", force: :cascade do |t|
    t.integer  "player_hero_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "best_lives", ["player_hero_id"], name: "index_best_lives_on_player_hero_id", using: :btree

  create_table "game_stats", force: :cascade do |t|
    t.string   "name"
    t.integer  "value"
    t.float    "average"
    t.integer  "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "game_stats", ["player_id"], name: "index_game_stats_on_player_id", using: :btree

  create_table "hero_per_games", force: :cascade do |t|
    t.integer  "player_hero_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "hero_per_games", ["player_hero_id"], name: "index_hero_per_games_on_player_hero_id", using: :btree

  create_table "hero_totals", force: :cascade do |t|
    t.integer  "player_hero_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "hero_totals", ["player_hero_id"], name: "index_hero_totals_on_player_hero_id", using: :btree

  create_table "heros", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "overall_stats", force: :cascade do |t|
    t.integer  "games"
    t.integer  "losses"
    t.integer  "rank"
    t.float    "win_rate"
    t.integer  "wins"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "player_id"
  end

  add_index "overall_stats", ["player_id"], name: "index_overall_stats_on_player_id", using: :btree

  create_table "player_heros", force: :cascade do |t|
    t.integer  "hero_id"
    t.integer  "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "player_heros", ["hero_id"], name: "index_player_heros_on_hero_id", using: :btree
  add_index "player_heros", ["player_id"], name: "index_player_heros_on_player_id", using: :btree

  create_table "players", force: :cascade do |t|
    t.string   "account_type"
    t.string   "tag"
    t.string   "region"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "specific_stats", force: :cascade do |t|
    t.integer  "player_hero_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "specific_stats", ["player_hero_id"], name: "index_specific_stats_on_player_hero_id", using: :btree

  create_table "stats", force: :cascade do |t|
    t.string   "name"
    t.float    "value"
    t.integer  "statable_id"
    t.string   "statable_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_foreign_key "best_games", "player_heros"
  add_foreign_key "best_lives", "player_heros"
  add_foreign_key "game_stats", "players"
  add_foreign_key "hero_per_games", "player_heros"
  add_foreign_key "hero_totals", "player_heros"
  add_foreign_key "overall_stats", "players"
  add_foreign_key "player_heros", "heros"
  add_foreign_key "player_heros", "players"
  add_foreign_key "specific_stats", "player_heros"
end
