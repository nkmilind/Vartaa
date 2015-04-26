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

  create_table "articles", force: :cascade do |t|
    t.text    "title"
    t.date    "date"
    t.integer "publication_id"
    t.integer "author_id"
    t.text    "first_few_lines"
    t.text    "photo_url"
    t.integer "category_id"
  end

  add_index "articles", ["author_id"], name: "index_articles_on_author_id"
  add_index "articles", ["category_id"], name: "index_articles_on_category_id"
  add_index "articles", ["publication_id"], name: "index_articles_on_publication_id"

  create_table "authors", force: :cascade do |t|
    t.string "name"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
  end

  create_table "publications", force: :cascade do |t|
    t.string "name"
  end

end
