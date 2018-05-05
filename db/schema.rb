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

ActiveRecord::Schema.define(version: 20180505052518) do

  create_table "devices", force: :cascade do |t|
    t.string "name"
    t.text "introduction"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "num"
    t.index ["user_id", "created_at"], name: "index_devices_on_user_id_and_created_at"
    t.index ["user_id", "num", "name"], name: "index_devices_on_user_id_and_num_and_name", unique: true
    t.index ["user_id"], name: "index_devices_on_user_id"
  end

  create_table "equips", force: :cascade do |t|
    t.string "specie"
    t.string "name"
    t.string "manufacturer"
    t.string "material"
    t.string "specification"
    t.integer "device_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "num"
    t.index ["device_id", "created_at"], name: "index_equips_on_device_id_and_created_at"
    t.index ["device_id", "num", "name", "specie"], name: "index_equips_on_device_id_and_num_and_name_and_specie", unique: true
    t.index ["device_id"], name: "index_equips_on_device_id"
  end

  create_table "pgrades", force: :cascade do |t|
    t.float "severe_point", default: 0.5
    t.float "minor_point", default: 0.8
    t.integer "point_num"
    t.integer "equip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["equip_id", "point_num"], name: "index_pgrades_on_equip_id_and_point_num", unique: true
  end

  create_table "points", force: :cascade do |t|
    t.float "original_thinckness"
    t.float "current_thinckness"
    t.integer "num"
    t.integer "equip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["equip_id", "created_at"], name: "index_points_on_equip_id_and_created_at"
    t.index ["equip_id"], name: "index_points_on_equip_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin", default: false
    t.string "point_adrr", default: "", null: false
    t.string "device_adrr", default: "", null: false
    t.string "equip_adrr", default: "", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
