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

ActiveRecord::Schema[7.0].define(version: 2022_07_25_132825) do
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

end
