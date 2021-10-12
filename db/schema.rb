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

ActiveRecord::Schema.define(version: 2021_09_15_085318) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fielder_stats", force: :cascade do |t|
    t.bigint "player_id", null: false
    t.integer "games"
    t.integer "plate_appearances"
    t.integer "at_bats"
    t.integer "runs"
    t.integer "hits"
    t.integer "two_base_hits"
    t.integer "three_base_hits"
    t.integer "home_runs"
    t.integer "base_hit"
    t.integer "RBI"
    t.integer "stolen_base"
    t.integer "caught_stealing"
    t.integer "sacrifice_bunts"
    t.integer "sacrifice_flys"
    t.integer "base_on_balls"
    t.integer "hits_by_pitch"
    t.integer "strike_outs"
    t.integer "double_play"
    t.string "batting_average"
    t.string "on_base_percentage"
    t.string "slugging_percentage"
    t.string "on_base_plus_slugging"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["player_id"], name: "index_fielder_stats_on_player_id"
  end

  create_table "notifing_stats", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "player_id", null: false
    t.string "kind"
    t.integer "target"
    t.integer "previous_stat"
    t.integer "latest_updated_value"
    t.boolean "mail", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["player_id"], name: "index_notifing_stats_on_player_id"
    t.index ["user_id"], name: "index_notifing_stats_on_user_id"
  end

  create_table "pitcher_stats", force: :cascade do |t|
    t.bigint "player_id", null: false
    t.integer "games"
    t.integer "win_pitchers"
    t.integer "lost_pitchers"
    t.integer "saves"
    t.integer "holds"
    t.integer "hold_points"
    t.integer "complete_games"
    t.integer "shut_outs"
    t.integer "no_base_on_balls"
    t.integer "hitters"
    t.integer "innings_pitched"
    t.integer "hits_Allowed"
    t.integer "home_runs_allowed"
    t.integer "base_on_balls"
    t.integer "hits_by_pitch"
    t.integer "strike_outs"
    t.integer "wild_pitchs"
    t.integer "balks"
    t.integer "runs_allowed"
    t.integer "earned_runs"
    t.string "earned_runs_average"
    t.string "whip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["player_id"], name: "index_pitcher_stats_on_player_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "uniform_number"
    t.string "name"
    t.string "player_url"
    t.string "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "name", null: false
    t.string "short_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_teams_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "fielder_stats", "players"
  add_foreign_key "notifing_stats", "players"
  add_foreign_key "notifing_stats", "users"
  add_foreign_key "pitcher_stats", "players"
end
