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

ActiveRecord::Schema.define(version: 20160924090905) do

  create_table "access_tokens", force: :cascade do |t|
    t.string  "token",   limit: 255,                 null: false
    t.boolean "revoked",             default: false, null: false
  end

  add_index "access_tokens", ["token"], name: "index_access_tokens_on_token", using: :btree

  create_table "tickets", force: :cascade do |t|
    t.string   "uid",        limit: 255,   null: false
    t.string   "title",      limit: 255,   null: false
    t.text     "content",    limit: 65535, null: false
    t.string   "status",     limit: 255,   null: false
    t.integer  "user_id",    limit: 4,     null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "tickets", ["uid"], name: "index_tickets_on_uid", using: :btree
  add_index "tickets", ["user_id"], name: "index_tickets_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string "uid",      limit: 255, null: false
    t.string "email",    limit: 255, null: false
    t.string "password", limit: 255, null: false
    t.string "role",     limit: 255, null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["uid"], name: "index_users_on_uid", using: :btree

end
