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

ActiveRecord::Schema[7.0].define(version: 2022_08_30_114200) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "batches", force: :cascade do |t|
    t.string "name", null: false
    t.string "url_identifier", null: false
    t.string "location", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_batches_on_name", unique: true
    t.index ["url_identifier"], name: "index_batches_on_url_identifier", unique: true
  end

  create_table "game_beatle_playlist_guesses", force: :cascade do |t|
    t.bigint "guessing_player_id", null: false
    t.bigint "guessing_game_beatle_playlist_id", null: false
    t.bigint "guessed_player_id"
    t.integer "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["guessed_player_id"], name: "index_game_beatle_playlist_guesses_on_guessed_player_id"
    t.index ["guessing_game_beatle_playlist_id"], name: "indx_guess_to_playlist"
    t.index ["guessing_player_id"], name: "index_game_beatle_playlist_guesses_on_guessing_player_id"
  end

  create_table "game_beatle_playlists", force: :cascade do |t|
    t.bigint "player_id", null: false
    t.string "track_1_url"
    t.string "track_2_url"
    t.string "track_3_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_game_beatle_playlists_on_player_id"
  end

  create_table "game_types", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", null: false
    t.string "instance_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["instance_type"], name: "index_game_types_on_instance_type", unique: true
    t.index ["name"], name: "index_game_types_on_name", unique: true
  end

  create_table "games", force: :cascade do |t|
    t.bigint "game_type_id", null: false
    t.bigint "batch_id", null: false
    t.bigint "user_id", null: false
    t.string "state", default: "initialized", null: false
    t.string "type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["batch_id"], name: "index_games_on_batch_id"
    t.index ["game_type_id"], name: "index_games_on_game_type_id"
    t.index ["user_id"], name: "index_games_on_user_id"
  end

  create_table "memberships", force: :cascade do |t|
    t.bigint "batch_id", null: false
    t.bigint "user_id", null: false
    t.string "role", default: "student", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["batch_id", "user_id"], name: "index_memberships_on_batch_id_and_user_id", unique: true
    t.index ["batch_id"], name: "index_memberships_on_batch_id"
    t.index ["user_id"], name: "index_memberships_on_user_id"
  end

  create_table "players", force: :cascade do |t|
    t.bigint "game_id", null: false
    t.bigint "user_id", null: false
    t.integer "points"
    t.integer "rank"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_players_on_game_id"
    t.index ["user_id"], name: "index_players_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "github_id", null: false
    t.string "nickname", null: false
    t.string "name"
    t.string "image_url", null: false
    t.string "privilege", default: "user", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["github_id"], name: "index_users_on_github_id", unique: true
  end

  add_foreign_key "game_beatle_playlist_guesses", "game_beatle_playlists", column: "guessing_game_beatle_playlist_id"
  add_foreign_key "game_beatle_playlist_guesses", "players", column: "guessed_player_id"
  add_foreign_key "game_beatle_playlist_guesses", "players", column: "guessing_player_id"
  add_foreign_key "game_beatle_playlists", "players"
  add_foreign_key "games", "batches"
  add_foreign_key "games", "game_types"
  add_foreign_key "games", "users"
  add_foreign_key "players", "games"
  add_foreign_key "players", "users"
end
