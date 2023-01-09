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

ActiveRecord::Schema[7.0].define(version: 2022_11_22_190607) do
  create_table "episodes", force: :cascade do |t|
    t.integer "spotify_account_id", null: false
    t.string "name"
    t.string "show"
    t.string "image"
    t.string "progress"
    t.string "spotify_id"
    t.string "status"
    t.boolean "starred"
    t.datetime "last_played"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["spotify_account_id"], name: "index_episodes_on_spotify_account_id"
  end

  create_table "shows", force: :cascade do |t|
    t.integer "spotify_account_id", null: false
    t.string "name"
    t.string "image"
    t.string "spotify_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["spotify_account_id"], name: "index_shows_on_spotify_account_id"
  end

  create_table "spotify_accounts", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "image"
    t.string "access_token"
    t.string "refresh_token"
    t.decimal "expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "episodes", "spotify_accounts"
  add_foreign_key "shows", "spotify_accounts"
end
