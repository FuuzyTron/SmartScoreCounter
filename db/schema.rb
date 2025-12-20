# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2025_12_20_144101) do
  create_table "attendance_days", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.date "day"
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_attendance_days_on_user_id"
  end

  create_table "schedule_days", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "day_of_week"
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_schedule_days_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "current_points", default: 0, null: false
    t.string "login"
    t.string "name"
    t.string "password_digest"
    t.integer "target_points", default: 60, null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "attendance_days", "users"
  add_foreign_key "schedule_days", "users"
end
