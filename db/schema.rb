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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20160622143030) do

  create_table "conversations", :force => true do |t|
    t.integer  "sender_id"
    t.integer  "reciever_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "hardwares", :force => true do |t|
    t.string   "name"
    t.integer  "owner_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "healths", :force => true do |t|
    t.integer  "user_id"
    t.string   "spo2"
    t.string   "h_rate"
    t.string   "h_signal"
    t.datetime "check_date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "messages", :force => true do |t|
    t.integer  "conversation_id"
    t.string   "massages"
    t.integer  "read_unread"
    t.datetime "time"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "relations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "patient_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "uid"
    t.string   "user_class"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
