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

  create_table "comments", force: :cascade do |t|
    t.integer "user_id"
    t.string  "article_id",   default: "50"
    t.text    "comment"
    t.date    "created_date"
    t.date    "updated_date"
  end

  add_index "comments", ["article_id"], name: "index_comments_on_article_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

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
    t.integer "likes"
    t.integer "dislikes"
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
    t.string  "city"
    t.boolean "admin",           default: false
  end

  create_table "userlikes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "likes"
    t.string  "article_id", default: "50"
  end

  add_index "userlikes", ["article_id"], name: "index_userlikes_on_article_id", using: :btree
  add_index "userlikes", ["user_id"], name: "index_userlikes_on_user_id", using: :btree

  add_foreign_key "content", "article", column: "id", name: "content_id_fkey"
  add_foreign_key "metatags", "article", column: "id", name: "metatags_id_fkey"
  add_foreign_key "ranking", "article", column: "id", name: "ranking_id_fkey"
end
