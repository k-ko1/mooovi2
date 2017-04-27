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

ActiveRecord::Schema.define(version: 20170427064348) do

  create_table "products", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "image_url",  limit: 65535
    t.string   "director",   limit: 255
    t.text     "detail",     limit: 65535
    t.string   "open_date",  limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string   "nickname",   limit: 255
    t.integer  "rate",       limit: 4
    t.text     "review",     limit: 65535
    t.integer  "product_id", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

end
