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

ActiveRecord::Schema.define(version: 2019_03_02_214643) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "optcodes", force: :cascade do |t|
    t.string "opt_code"
    t.string "expire_at"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "provider"
    t.string "uid"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "encrypted_password", null: false
    t.string "phone_number"
    t.string "user_name"
    t.string "longitude"
    t.string "latitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["latitude", "longitude"], name: "index_users_on_latitude_and_longitude"
    t.index ["phone_number"], name: "index_users_on_phone_number", unique: true
  end

end
