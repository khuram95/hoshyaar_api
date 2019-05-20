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

ActiveRecord::Schema.define(version: 2019_05_17_203725) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comment_photos", force: :cascade do |t|
    t.string "image"
    t.integer "comment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "text"
    t.string "image"
    t.string "voice_message"
    t.string "video"
    t.integer "report_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "my_interests", force: :cascade do |t|
    t.integer "user_id"
    t.integer "school_id"
  end

  create_table "non_salary_budgets", force: :cascade do |t|
    t.string "school_id"
    t.integer "current_year_expenture"
    t.integer "balance"
    t.integer "total_funds_available"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "user_id"
    t.integer "report_id"
    t.text "notification_text"
  end

  create_table "otpcodes", force: :cascade do |t|
    t.string "otp_code"
    t.string "expire_at"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photos", force: :cascade do |t|
    t.string "image"
    t.integer "report_id"
    t.integer "latitude"
    t.integer "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "report_reactions", force: :cascade do |t|
    t.integer "report_id"
    t.boolean "is_agree"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "reports", force: :cascade do |t|
    t.integer "authencity"
    t.integer "user_id"
    t.string "report_date"
    t.string "report_text"
    t.string "removed_date"
    t.string "is_removed"
    t.float "longitude"
    t.float "latitude"
    t.integer "removed_by"
    t.integer "school_id"
    t.string "video"
    t.string "voice_message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "school_details", force: :cascade do |t|
    t.integer "total_class_rooms"
    t.integer "use_class_rooms"
    t.integer "total_teacher"
    t.integer "non_teacher"
    t.integer "toilet_avaliable"
    t.integer "toilet_functional"
    t.boolean "is_toilet_functional"
    t.integer "student_enrolled"
    t.integer "student_present"
    t.boolean "is_electricity_avaliable"
    t.boolean "is_drinking_water_avaliable"
    t.boolean "is_boundary_wall"
    t.float "avaliable_fund"
    t.float "expenditure"
    t.float "balance"
    t.integer "school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "visiting_date"
  end

  create_table "schools", primary_key: "emis", id: :string, force: :cascade do |t|
    t.date "visting_date"
    t.string "school_name"
    t.string "district"
    t.string "tehsil"
    t.string "markaz"
    t.string "school_level"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscribes", force: :cascade do |t|
    t.integer "school_id"
    t.integer "user_id"
    t.string "region"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "phone_number", null: false
    t.string "uid", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "encrypted_password", null: false
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_phone_number"
    t.string "phone_number"
    t.string "user_name"
    t.string "longitude"
    t.string "latitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.json "tokens"
    t.boolean "is_verified", default: false
    t.jsonb "device_ids", default: []
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["latitude", "longitude"], name: "index_users_on_latitude_and_longitude"
    t.index ["phone_number"], name: "index_users_on_phone_number", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  create_table "verified_school_data", force: :cascade do |t|
    t.integer "school_detail_id"
    t.integer "user_id"
    t.date "verifed_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
