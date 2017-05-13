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

ActiveRecord::Schema.define(version: 20170510094241) do

  create_table "dojos", force: :cascade do |t|
    t.integer "user_id"
    t.string "title"
    t.text "description"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.integer "coding_time"
    t.integer "break_time"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "theme_id"
    t.index ["theme_id"], name: "index_dojos_on_theme_id"
    t.index ["user_id"], name: "index_dojos_on_user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.integer "user_id"
    t.integer "dojo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dojo_id"], name: "index_locations_on_dojo_id"
    t.index ["user_id"], name: "index_locations_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "user_id"
    t.boolean "active", default: true
    t.text "message"
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "notifiers_observers", force: :cascade do |t|
    t.integer "theme_id"
    t.integer "user_id"
    t.index ["theme_id"], name: "index_notifiers_observers_on_theme_id"
    t.index ["user_id"], name: "index_notifiers_observers_on_user_id"
  end

  create_table "themes", force: :cascade do |t|
    t.string "name"
    t.string "icon_name"
    t.string "theme_background"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "videos", force: :cascade do |t|
    t.string "source"
    t.integer "dojo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dojo_id"], name: "index_videos_on_dojo_id"
  end

end
