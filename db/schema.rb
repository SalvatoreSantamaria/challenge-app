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

ActiveRecord::Schema.define(version: 2020_01_25_155104) do

  create_table "challenges", force: :cascade do |t|
    t.string "short_name"
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "team_one_completed"
    t.boolean "team_two_completed"
    t.integer "team_one_points_total"
    t.integer "team_two_points_total"
    t.integer "challenge_points"
    t.integer "team_id"
  end

  create_table "points", force: :cascade do |t|
    t.integer "team_one_points_total"
    t.integer "team_two_points_total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scores", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "team_id"
    t.integer "team_score"
  end

  create_table "team_challenges", force: :cascade do |t|
    t.integer "team_id"
    t.integer "challenge_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.integer "score_id"
  end

  create_table "teams_to_delete", force: :cascade do |t|
    t.string "team_one"
    t.string "team_two"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
