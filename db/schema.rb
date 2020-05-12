# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_12_005724) do

  create_table "games", force: :cascade do |t|
    t.integer "player_1"
    t.integer "player_2"
    t.integer "player_3"
    t.integer "p1_score"
    t.integer "p2_score"
    t.integer "p3_score"
    t.integer "winner_id"
    t.string "status", default: "incomplete"
    t.integer "dealer"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "hands", force: :cascade do |t|
    t.string "p1_score"
    t.string "p2_score"
    t.string "p3_score"
    t.string "bid"
    t.string "trump"
    t.integer "bidder_id"
    t.string "p1_status"
    t.string "p2_status"
    t.string "p3_status"
    t.integer "game_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_hands_on_game_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "hands", "games"
end
