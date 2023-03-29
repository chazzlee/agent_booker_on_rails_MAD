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

ActiveRecord::Schema[7.0].define(version: 2023_03_28_184844) do
  create_table "agents", force: :cascade do |t|
    t.string "name", null: false
    t.integer "timezone_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["timezone_id"], name: "index_agents_on_timezone_id"
  end

  create_table "appointments", force: :cascade do |t|
    t.integer "availability_id", null: false
    t.integer "agent_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agent_id"], name: "index_appointments_on_agent_id"
    t.index ["availability_id"], name: "index_appointments_on_availability_id"
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "availabilities", force: :cascade do |t|
    t.string "day_of_week", null: false
    t.time "start_at", null: false
    t.time "end_until", null: false
    t.boolean "reserved", default: false, null: false
    t.integer "agent_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agent_id"], name: "index_availabilities_on_agent_id"
  end

  create_table "timezones", force: :cascade do |t|
    t.string "full_name"
    t.string "short_name"
    t.string "offset"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", default: "guest"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "appointments", "agents"
  add_foreign_key "appointments", "availabilities"
  add_foreign_key "appointments", "users"
  add_foreign_key "availabilities", "agents"
end
