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

ActiveRecord::Schema.define(version: 2020_09_08_144643) do

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.string "date"
    t.text "biography"
    t.integer "museum_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["museum_id"], name: "index_artists_on_museum_id"
  end

  create_table "arts", force: :cascade do |t|
    t.string "title"
    t.date "date"
    t.string "medium"
    t.string "object"
    t.string "image"
    t.integer "artist_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["artist_id"], name: "index_arts_on_artist_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.integer "user_id", null: false
    t.integer "user_art_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_art_id"], name: "index_comments_on_user_art_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "museums", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.text "bio"
    t.string "website"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_arts", force: :cascade do |t|
    t.integer "art_id", null: false
    t.integer "user_id", null: false
    t.text "blurb"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["art_id"], name: "index_user_arts_on_art_id"
    t.index ["user_id"], name: "index_user_arts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "bio"
    t.string "profile_picture"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "artists", "museums"
  add_foreign_key "arts", "artists"
  add_foreign_key "comments", "user_arts"
  add_foreign_key "comments", "users"
  add_foreign_key "user_arts", "arts"
  add_foreign_key "user_arts", "users"
end
