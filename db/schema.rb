# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_11_072025) do

  create_table "conversations", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "reciever_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hardwares", force: :cascade do |t|
    t.string "name"
    t.integer "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "healths", force: :cascade do |t|
    t.integer "user_id"
    t.string "spo2"
    t.string "h_rate"
    t.string "h_signal"
    t.datetime "check_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_healths_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.integer "conversation_id"
    t.string "massages"
    t.integer "read_unread"
    t.datetime "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
  end

  create_table "relations", force: :cascade do |t|
    t.integer "user_id"
    t.integer "patient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_relations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "uid"
    t.string "user_class"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password"
  end

end
