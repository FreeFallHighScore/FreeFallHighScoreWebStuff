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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110911053603) do

  create_table "users", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",      :default => false
  end

  create_table "videos", :force => true do |t|
    t.string   "youtube_id"
    t.integer  "length"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "author"
    t.integer  "drop_time"
    t.string   "title"
    t.text     "description"
    t.datetime "published_at"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "make"
    t.string   "system"
    t.string   "version"
    t.boolean  "disabled",     :default => false
    t.integer  "rank"
    t.string   "city"
    t.string   "state"
    t.string   "country"
  end

  add_index "videos", ["author"], :name => "index_videos_on_author"
  add_index "videos", ["youtube_id"], :name => "index_videos_on_youtube_id", :unique => true

end
