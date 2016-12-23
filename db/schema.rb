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

ActiveRecord::Schema.define(version: 20161221002528) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bands", force: :cascade do |t|
    t.string   "bandname"
    t.string   "genre"
    t.string   "bio"
    t.string   "youtube"
    t.string   "soundcloud"
    t.string   "bandcamp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "location"
    t.string   "lookingfor"
  end

  create_table "bands_musicians", force: :cascade do |t|
    t.integer "band_id"
    t.integer "musician_id"
  end

  create_table "musicians", force: :cascade do |t|
    t.string   "name"
    t.string   "bio"
    t.string   "instruments"
    t.string   "location"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "email"
    t.string   "password_digest"
    t.string   "username"
    t.string   "youtube"
    t.string   "soundcloud"
    t.string   "bandcamp"
  end

end
