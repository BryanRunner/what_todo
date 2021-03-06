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

ActiveRecord::Schema.define(version: 20150804231656) do

  create_table "todo_items", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.datetime "due_date"
    t.text     "title",      limit: 65535
    t.text     "note",       limit: 65535
    t.boolean  "completed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "todo_items", ["user_id"], name: "index_todo_items_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.integer  "todo_items_id",   limit: 4
    t.string   "email",           limit: 255
    t.string   "password_digest", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "users", ["todo_items_id"], name: "index_users_on_todo_items_id", using: :btree

end
