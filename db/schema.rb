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

ActiveRecord::Schema.define(:version => 20120118065109) do

  create_table "cities", :force => true do |t|
    t.integer "state_id"
    t.string  "name"
    t.float   "lat"
    t.float   "long"
  end

  add_index "cities", ["lat"], :name => "index_cities_on_lat"
  add_index "cities", ["long"], :name => "index_cities_on_long"
  add_index "cities", ["name"], :name => "index_cities_on_name"
  add_index "cities", ["state_id"], :name => "index_cities_on_state_id"

  create_table "countries", :force => true do |t|
    t.string "name"
    t.string "abbr"
  end

  add_index "countries", ["abbr"], :name => "index_countries_on_abbr"
  add_index "countries", ["name"], :name => "index_countries_on_name"

  create_table "coworker_requests", :force => true do |t|
    t.integer  "position_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "coworker_requests", ["position_id"], :name => "index_coworker_requests_on_position_id"
  add_index "coworker_requests", ["user_id"], :name => "index_coworker_requests_on_user_id"

  create_table "fellowships", :force => true do |t|
    t.integer  "inviter_id"
    t.integer  "invited_id"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "message_copies", :force => true do |t|
    t.integer  "sent_messageable_id"
    t.string   "sent_messageable_type"
    t.integer  "recipient_id"
    t.string   "subject"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "message_copies", ["sent_messageable_id", "recipient_id"], :name => "outbox_idx"

  create_table "messages", :force => true do |t|
    t.integer  "received_messageable_id"
    t.string   "received_messageable_type"
    t.integer  "sender_id"
    t.string   "subject"
    t.text     "body"
    t.boolean  "opened",                    :default => false
    t.boolean  "deleted",                   :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["received_messageable_id", "sender_id"], :name => "inbox_idx"

  create_table "positions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", :force => true do |t|
    t.string   "name"
    t.text     "motto"
    t.string   "website"
    t.string   "status"
    t.boolean  "receive_newsletter"
    t.boolean  "published"
    t.integer  "position_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "city_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "profiles", ["city_id"], :name => "index_profiles_on_city_id"
  add_index "profiles", ["position_id"], :name => "index_profiles_on_position_id"
  add_index "profiles", ["user_id"], :name => "index_profiles_on_user_id"

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer  "role_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states", :force => true do |t|
    t.integer "country_id"
    t.string  "name"
    t.string  "abbr"
    t.string  "timezone"
  end

  add_index "states", ["abbr"], :name => "index_states_on_abbr"
  add_index "states", ["country_id"], :name => "index_states_on_country_id"
  add_index "states", ["name"], :name => "index_states_on_name"

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.text     "motto"
    t.string   "website"
    t.string   "status"
    t.boolean  "receive_newsletter"
    t.integer  "location_id"
    t.integer  "city_id"
    t.string   "username"
  end

  add_index "users", ["city_id"], :name => "index_users_on_city_id"
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
