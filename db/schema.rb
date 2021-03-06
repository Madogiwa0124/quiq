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

ActiveRecord::Schema.define(version: 2018_08_26_014013) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answer_choices", force: :cascade do |t|
    t.bigint "quiz_id", null: false
    t.bigint "choice_id", null: false
    t.integer "answer_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["choice_id"], name: "index_answer_choices_on_choice_id"
    t.index ["quiz_id"], name: "index_answer_choices_on_quiz_id"
  end

  create_table "choices", force: :cascade do |t|
    t.bigint "quiz_id", null: false
    t.string "sentence", null: false
    t.boolean "correct", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quiz_id"], name: "index_choices_on_quiz_id"
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "quiz_id", null: false
    t.integer "like_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quiz_id"], name: "index_likes_on_quiz_id"
  end

  create_table "quizzes", force: :cascade do |t|
    t.string "title", null: false
    t.text "body"
    t.text "explanation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ctype"
    t.binary "image"
  end

  add_foreign_key "answer_choices", "choices"
  add_foreign_key "answer_choices", "quizzes"
  add_foreign_key "choices", "quizzes"
  add_foreign_key "likes", "quizzes"
end
