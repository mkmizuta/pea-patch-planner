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

ActiveRecord::Schema.define(version: 20140219184757) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blogposts", force: true do |t|
    t.string   "title"
    t.text     "post_text"
    t.string   "pic_upload"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "days_weathers", force: true do |t|
    t.string  "description"
    t.integer "forecast_association"
    t.float   "temp"
    t.string  "icon"
    t.integer "place_value"
  end

  create_table "events", force: true do |t|
    t.string   "name"
    t.datetime "start_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tools", force: true do |t|
    t.string  "name"
    t.text    "description"
    t.integer "owner"
  end

  create_table "tools_users", force: true do |t|
    t.integer  "tool_id"
    t.integer  "user_id"
    t.datetime "checkout"
    t.datetime "checkin"
  end

  create_table "users", force: true do |t|
    t.string  "username"
    t.string  "uid"
    t.string  "email"
    t.boolean "admin"
    t.string  "provider"
  end

  create_table "weathers", force: true do |t|
    t.datetime "dt"
  end

end
