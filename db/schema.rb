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

ActiveRecord::Schema[7.1].define(version: 2024_02_25_223149) do
  create_table "anime_lists", force: :cascade do |t|
    t.integer "anime_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "list_type", default: 0
    t.date "start_date"
    t.date "end_date"
    t.integer "episodes_watched"
    t.index ["anime_id"], name: "index_anime_lists_on_anime_id"
    t.index ["user_id"], name: "index_anime_lists_on_user_id"
  end

  create_table "animes", force: :cascade do |t|
    t.string "english_title"
    t.string "romanji_title"
    t.date "start_air_date"
    t.date "end_air_date"
    t.integer "number_of_episodes"
    t.text "description"
    t.string "season"
    t.string "studio"
    t.string "source"
    t.string "duration"
    t.string "age_rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "animes_genres", id: false, force: :cascade do |t|
    t.integer "anime_id", null: false
    t.integer "genre_id", null: false
  end

  create_table "cast_and_crews", force: :cascade do |t|
    t.integer "anime_id", null: false
    t.integer "person_id", null: false
    t.string "role"
    t.string "character"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["anime_id"], name: "index_cast_and_crews_on_anime_id"
    t.index ["person_id"], name: "index_cast_and_crews_on_person_id"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "review_id", null: false
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["review_id"], name: "index_comments_on_review_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.text "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "birthday"
    t.string "website"
    t.string "alternate_names"
    t.text "more"
    t.string "language"
  end

  create_table "profiles", force: :cascade do |t|
    t.integer "user_id", null: false
    t.text "bio"
    t.string "profile_picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "anime_id", null: false
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["anime_id"], name: "index_ratings_on_anime_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "anime_id", null: false
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["anime_id"], name: "index_reviews_on_anime_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "anime_lists", "animes"
  add_foreign_key "anime_lists", "users"
  add_foreign_key "cast_and_crews", "animes"
  add_foreign_key "cast_and_crews", "people"
  add_foreign_key "comments", "reviews"
  add_foreign_key "comments", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "ratings", "animes"
  add_foreign_key "ratings", "users"
  add_foreign_key "reviews", "animes"
  add_foreign_key "reviews", "users"
end
