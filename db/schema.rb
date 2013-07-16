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

ActiveRecord::Schema.define(version: 20130709013208) do

  create_table "instruction_factories", force: true do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "classname"
  end

  create_table "instructions", force: true do |t|
    t.string   "name"
    t.string   "code"
    t.integer  "skwerkflow_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "factory_id"
    t.string   "type"
  end

  add_index "instructions", ["factory_id"], name: "index_instructions_on_factory_id"
  add_index "instructions", ["skwerkflow_id"], name: "index_instructions_on_skwerkflow_id"

  create_table "skwerkflows", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "web_pages", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
