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

ActiveRecord::Schema.define(version: 2020_09_04_224430) do

  create_table "actors", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.boolean "oscar_nominee", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "casts", force: :cascade do |t|
    t.integer "actor_id"
    t.integer "movie_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["actor_id"], name: "index_casts_on_actor_id"
    t.index ["movie_id"], name: "index_casts_on_movie_id"
  end

  create_table "directors", force: :cascade do |t|
    t.string "name"
    t.integer "age"
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.string "year"
    t.string "plot_keywords"
    t.integer "facebook_likes"
    t.integer "color_format", default: 0
    t.integer "director_id"
    t.integer "producer_id"
    t.index ["director_id"], name: "index_movies_on_director_id"
    t.index ["producer_id"], name: "index_movies_on_producer_id"
  end

  create_table "producers", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "casts", "actors"
  add_foreign_key "casts", "movies"
  add_foreign_key "movies", "directors"
  add_foreign_key "movies", "producers"
end
