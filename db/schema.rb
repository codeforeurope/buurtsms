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

ActiveRecord::Schema.define(:version => 20130424095903) do

  create_table "in_messages", :force => true do |t|
    t.string   "message_type"
    t.string   "to"
    t.string   "msisdn"
    t.string   "network_code"
    t.text     "message_id"
    t.datetime "message_timestamp"
    t.text     "text"
    t.boolean  "concat"
    t.string   "concat_ref"
    t.integer  "concat_total"
    t.integer  "concat_part"
    t.string   "status"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.boolean  "posted_to_fb"
  end

  create_table "inbound_messages", :force => true do |t|
    t.string   "type"
    t.string   "to"
    t.string   "msisdn"
    t.string   "network_code"
    t.text     "message_id"
    t.datetime "message_timestamp"
    t.text     "text"
    t.boolean  "concat"
    t.string   "concat_ref"
    t.integer  "concat_total"
    t.integer  "concat_part"
    t.string   "status"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "out_messages", :force => true do |t|
    t.string   "from"
    t.string   "to"
    t.string   "type"
    t.text     "text"
    t.datetime "timestamp"
    t.datetime "message_date"
    t.string   "message_id"
    t.string   "error_text"
    t.string   "status"
    t.integer  "in_message_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "outbound_messages", :force => true do |t|
    t.string   "from"
    t.string   "to"
    t.string   "type"
    t.text     "text"
    t.datetime "timestamp"
    t.datetime "message_date"
    t.string   "message_id"
    t.string   "error_text"
    t.string   "status"
    t.integer  "in_message_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.boolean  "admin"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
