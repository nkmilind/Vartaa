# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 0) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "article", force: :cascade do |t|
    t.text    "title",       null: false
    t.date    "date"
    t.integer "source_id",   null: false
    t.text    "author_ids"
    t.text    "description"
    t.text    "photo_url"
    t.text    "url"
    t.integer "category_id"
  end

  add_index "article", ["date"], name: "time_idx", using: :btree

  create_table "author", id: false, force: :cascade do |t|
    t.integer "id"
    t.string  "name",  limit: 50
    t.integer "count"
  end

  create_table "category", id: false, force: :cascade do |t|
    t.integer "id"
    t.string  "name"
  end

  create_table "content", id: false, force: :cascade do |t|
    t.text "id"
    t.text "content"
  end

  create_table "metatags", id: false, force: :cascade do |t|
    t.text "id"
    t.text "tags"
  end

  create_table "ranking", id: false, force: :cascade do |t|
    t.text    "id"
    t.integer "auto"
    t.integer "admin"
    t.integer "page_rank"
  end

  add_index "ranking", ["id"], name: "id_idx", using: :btree

  create_table "source", id: false, force: :cascade do |t|
    t.integer "id"
    t.string  "name"
  end

  create_table "user", force: :cascade do |t|
    t.string  "name"
    t.string  "email"
    t.string  "password_digest"
    t.boolean "admin",           default: false
    t.string  "city"
  end

  add_foreign_key "content", "article", column: "id", name: "content_id_fkey"
  add_foreign_key "metatags", "article", column: "id", name: "metatags_id_fkey"
  add_foreign_key "ranking", "article", column: "id", name: "ranking_id_fkey"
end
