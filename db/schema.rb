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

ActiveRecord::Schema[7.0].define(version: 2023_06_28_023136) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "albums", force: :cascade do |t|
    t.string "title"
    t.string "sharing_mode"
    t.integer "number_photo"
    t.string "description"
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "users_id"
    t.index ["users_id"], name: "index_albums_on_users_id"
  end

  create_table "on_follows", force: :cascade do |t|
    t.bigint "follower_id"
    t.bigint "followee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photo_belong_to_albums", force: :cascade do |t|
    t.bigint "photo_id"
    t.bigint "album_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photo_belong_to_users", force: :cascade do |t|
    t.bigint "photo_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photos", force: :cascade do |t|
    t.string "title"
    t.string "sharing_mode"
    t.string "description"
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "last_login", precision: nil
    t.boolean "active"
    t.string "password"
    t.bigint "admin_id"
  end

  add_foreign_key "albums", "users", column: "users_id"
  add_foreign_key "on_follows", "users", column: "followee_id"
  add_foreign_key "on_follows", "users", column: "follower_id"
  add_foreign_key "photo_belong_to_albums", "albums"
  add_foreign_key "photo_belong_to_albums", "photos"
  add_foreign_key "photo_belong_to_users", "photos"
  add_foreign_key "photo_belong_to_users", "users"
  add_foreign_key "users", "users", column: "admin_id"
end
