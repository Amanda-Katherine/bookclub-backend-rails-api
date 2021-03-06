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

ActiveRecord::Schema.define(version: 2020_10_27_035444) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "book_groups", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.string "image"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "gatherings", force: :cascade do |t|
    t.string "host"
    t.string "date"
    t.string "address"
    t.string "time"
    t.bigint "book_group_id", null: false
    t.bigint "book_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_group_id"], name: "index_gatherings_on_book_group_id"
    t.index ["book_id"], name: "index_gatherings_on_book_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.bigint "book_group_id", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_group_id"], name: "index_members_on_book_group_id"
  end

  create_table "suggestions", force: :cascade do |t|
    t.bigint "book_group_id", null: false
    t.bigint "book_id", null: false
    t.integer "vote", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_group_id"], name: "index_suggestions_on_book_group_id"
    t.index ["book_id"], name: "index_suggestions_on_book_id"
  end

  add_foreign_key "gatherings", "book_groups"
  add_foreign_key "gatherings", "books"
  add_foreign_key "members", "book_groups"
  add_foreign_key "suggestions", "book_groups"
  add_foreign_key "suggestions", "books"
end
