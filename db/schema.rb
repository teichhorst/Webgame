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

ActiveRecord::Schema.define(:version => 20121028214907) do

  create_table "boots", :force => true do |t|
    t.integer  "user_id"
    t.boolean  "active"
    t.string   "display_name"
    t.string   "description"
    t.string   "quality"
    t.string   "strength"
    t.string   "weakness"
    t.string   "strength_roll"
    t.boolean  "bought"
    t.integer  "buy"
    t.integer  "sell"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "min_speed"
    t.integer  "max_speed"
    t.integer  "min_block"
    t.integer  "max_block"
    t.integer  "base_min_speed"
    t.integer  "base_max_speed"
    t.integer  "base_min_block"
    t.integer  "base_max_block"
    t.integer  "level"
    t.integer  "list_boot_id"
    t.integer  "color_id"
  end

  create_table "boxes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "fight_id"
    t.string   "display_name"
    t.integer  "item_quantity"
    t.integer  "gold"
    t.string   "summary"
    t.string   "size"
    t.integer  "odds"
    t.integer  "loser"
    t.boolean  "opened"
    t.string   "description"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "user_name"
    t.string   "loser_name"
    t.boolean  "bought_at_shop"
  end

  create_table "chests", :force => true do |t|
    t.integer  "user_id"
    t.boolean  "active"
    t.string   "display_name"
    t.string   "description"
    t.string   "strength"
    t.string   "weakness"
    t.integer  "strength_roll"
    t.string   "quality"
    t.boolean  "bought"
    t.integer  "buy"
    t.integer  "sell"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "min_speed"
    t.integer  "max_speed"
    t.integer  "min_block"
    t.integer  "max_block"
    t.integer  "base_min_speed"
    t.integer  "base_max_speed"
    t.integer  "base_min_block"
    t.integer  "base_max_block"
    t.integer  "level"
    t.integer  "list_chest_id"
    t.integer  "color_id"
  end

  create_table "cities", :force => true do |t|
    t.string   "display_name"
    t.integer  "coordinate_x"
    t.integer  "coordinate_y"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "colors", :force => true do |t|
    t.string   "display_name"
    t.string   "hex_code"
    t.string   "odds"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "complexes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "city_id"
    t.string   "display_name"
    t.string   "image"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "fights", :force => true do |t|
    t.integer  "user_id"
    t.integer  "room_id"
    t.integer  "odds"
    t.boolean  "fought"
    t.boolean  "won_by_thief"
    t.string   "description"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "guard_name"
    t.string   "pet_name"
    t.string   "trap_name"
    t.string   "room_user_name"
    t.string   "opening"
    t.integer  "pet_health"
    t.integer  "guard_health"
    t.integer  "trap_health"
    t.integer  "user_health"
    t.boolean  "guard_defeated"
    t.boolean  "pet_defeated"
    t.boolean  "trap_defeated"
    t.integer  "user_stamina"
    t.integer  "guard_stamina"
    t.integer  "pet_stamina"
    t.integer  "trap_stamina"
  end

  create_table "furnishings", :force => true do |t|
    t.integer  "user_id"
    t.integer  "room_id"
    t.string   "display_name"
    t.integer  "buy"
    t.integer  "sell"
    t.integer  "worth"
    t.string   "image"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.boolean  "bought"
    t.integer  "level"
  end

  create_table "guards", :force => true do |t|
    t.integer  "room_id"
    t.integer  "user_id"
    t.string   "display_name"
    t.string   "description"
    t.string   "size"
    t.integer  "size_roll"
    t.string   "strength"
    t.string   "weakness"
    t.string   "strength_roll"
    t.boolean  "bought"
    t.integer  "buy"
    t.integer  "sell"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "min_speed"
    t.integer  "max_speed"
    t.integer  "min_damage"
    t.integer  "max_damage"
    t.integer  "min_block"
    t.integer  "max_block"
    t.integer  "health"
    t.integer  "level"
    t.integer  "list_guard_id"
    t.integer  "base_min_damage"
    t.integer  "base_max_damage"
    t.integer  "base_min_speed"
    t.integer  "base_max_speed"
    t.integer  "base_min_block"
    t.integer  "base_max_block"
    t.integer  "base_health"
    t.integer  "hunger"
    t.integer  "color_id"
  end

  create_table "hands", :force => true do |t|
    t.integer  "user_id"
    t.boolean  "active"
    t.string   "display_name"
    t.string   "description"
    t.string   "quality"
    t.string   "strength"
    t.string   "weakness"
    t.string   "strength_roll"
    t.boolean  "bought"
    t.integer  "buy"
    t.integer  "sell"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "min_speed"
    t.integer  "max_speed"
    t.integer  "min_block"
    t.integer  "max_block"
    t.integer  "list_hand_id"
    t.integer  "level"
    t.integer  "base_min_speed"
    t.integer  "base_max_speed"
    t.integer  "base_min_block"
    t.integer  "base_max_block"
    t.integer  "color_id"
  end

  create_table "heads", :force => true do |t|
    t.integer  "user_id"
    t.boolean  "active"
    t.string   "display_name"
    t.string   "description"
    t.string   "quality"
    t.boolean  "bought"
    t.integer  "buy"
    t.integer  "sell"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "min_speed"
    t.integer  "max_speed"
    t.integer  "min_block"
    t.integer  "max_block"
    t.integer  "base_min_speed"
    t.integer  "base_max_speed"
    t.integer  "base_min_block"
    t.integer  "base_max_block"
    t.integer  "level"
    t.integer  "list_head_id"
    t.integer  "color_id"
  end

  create_table "legs", :force => true do |t|
    t.integer  "user_id"
    t.boolean  "active"
    t.string   "display_name"
    t.string   "description"
    t.string   "quality"
    t.boolean  "bought"
    t.integer  "buy"
    t.integer  "sell"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "min_speed"
    t.integer  "max_speed"
    t.integer  "min_block"
    t.integer  "max_block"
    t.integer  "base_min_speed"
    t.integer  "base_max_speed"
    t.integer  "base_min_block"
    t.integer  "base_max_block"
    t.integer  "level"
    t.integer  "list_leg_id"
    t.integer  "color_id"
  end

  create_table "list_boots", :force => true do |t|
    t.string   "display_name"
    t.string   "description"
    t.integer  "min_speed"
    t.integer  "max_speed"
    t.integer  "min_block"
    t.integer  "max_block"
    t.integer  "min_damage"
    t.integer  "max_damage"
    t.integer  "odds"
    t.string   "boot_image_file_name"
    t.string   "boot_image_content_type"
    t.integer  "boot_image_file_size"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "list_chests", :force => true do |t|
    t.string   "display_name"
    t.string   "description"
    t.integer  "min_speed"
    t.integer  "max_speed"
    t.integer  "min_block"
    t.integer  "max_block"
    t.integer  "min_damage"
    t.integer  "max_damage"
    t.integer  "odds"
    t.string   "chest_image_file_name"
    t.string   "chest_image_content_type"
    t.integer  "chest_image_file_size"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "list_guards", :force => true do |t|
    t.string   "display_name"
    t.string   "description"
    t.integer  "min_speed"
    t.integer  "max_speed"
    t.integer  "min_damage"
    t.integer  "max_damage"
    t.integer  "min_block"
    t.integer  "max_block"
    t.integer  "health"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.integer  "odds"
    t.string   "guard_image_file_name"
    t.string   "guard_image_content_type"
    t.integer  "guard_image_file_size"
  end

  create_table "list_hands", :force => true do |t|
    t.string   "display_name"
    t.string   "description"
    t.integer  "min_speed"
    t.integer  "max_speed"
    t.integer  "min_block"
    t.integer  "max_block"
    t.integer  "min_damage"
    t.integer  "max_damage"
    t.integer  "odds"
    t.string   "hand_image_file_name"
    t.string   "hand_image_content_type"
    t.integer  "hand_image_file_size"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "list_heads", :force => true do |t|
    t.string   "display_name"
    t.string   "description"
    t.integer  "min_speed"
    t.integer  "max_speed"
    t.integer  "min_block"
    t.integer  "max_block"
    t.integer  "min_damage"
    t.integer  "max_damage"
    t.integer  "odds"
    t.string   "head_image_file_name"
    t.string   "head_image_content_type"
    t.integer  "head_image_file_size"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "list_legs", :force => true do |t|
    t.string   "display_name"
    t.string   "description"
    t.integer  "min_speed"
    t.integer  "max_speed"
    t.integer  "min_block"
    t.integer  "max_block"
    t.integer  "min_damage"
    t.integer  "max_damage"
    t.integer  "odds"
    t.string   "leg_image_file_name"
    t.string   "leg_image_content_type"
    t.integer  "leg_image_file_size"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  create_table "list_pets", :force => true do |t|
    t.string   "display_name"
    t.string   "description"
    t.integer  "min_speed"
    t.integer  "max_speed"
    t.integer  "min_block"
    t.integer  "max_block"
    t.integer  "min_damage"
    t.integer  "max_damage"
    t.integer  "odds"
    t.integer  "health"
    t.string   "pet_image_file_name"
    t.string   "pet_image_content_type"
    t.integer  "pet_image_file_size"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  create_table "list_rings", :force => true do |t|
    t.string   "display_name"
    t.string   "description"
    t.integer  "min_speed"
    t.integer  "max_speed"
    t.integer  "min_block"
    t.integer  "max_block"
    t.integer  "min_damage"
    t.integer  "max_damage"
    t.integer  "odds"
    t.string   "ring_image_file_name"
    t.string   "ring_image_content_type"
    t.integer  "ring_image_file_size"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "list_sidearms", :force => true do |t|
    t.string   "display_name"
    t.string   "description"
    t.integer  "min_speed"
    t.integer  "max_speed"
    t.integer  "min_block"
    t.integer  "max_block"
    t.integer  "min_damage"
    t.integer  "max_damage"
    t.integer  "odds"
    t.string   "sidearm_image_file_name"
    t.string   "sidearm_image_content_type"
    t.integer  "sidearm_image_file_size"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "list_traps", :force => true do |t|
    t.string   "display_name"
    t.string   "description"
    t.integer  "min_speed"
    t.integer  "max_speed"
    t.integer  "min_block"
    t.integer  "max_block"
    t.integer  "min_damage"
    t.integer  "max_damage"
    t.integer  "odds"
    t.integer  "health"
    t.string   "trap_image_file_name"
    t.string   "trap_image_content_type"
    t.integer  "trap_image_file_size"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "list_weapons", :force => true do |t|
    t.string   "display_name"
    t.string   "description"
    t.integer  "min_speed"
    t.integer  "max_speed"
    t.integer  "min_block"
    t.integer  "max_block"
    t.integer  "min_damage"
    t.integer  "max_damage"
    t.integer  "odds"
    t.string   "weapon_image_file_name"
    t.string   "weapon_image_content_type"
    t.integer  "weapon_image_file_size"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "moves", :force => true do |t|
    t.integer  "user_id"
    t.integer  "fight_id"
    t.integer  "opponent"
    t.integer  "opponent_health_loss"
    t.integer  "opponent_health_before"
    t.integer  "opponent_health_after"
    t.integer  "health_loss"
    t.integer  "health_before"
    t.integer  "health_after"
    t.integer  "stamina_loss"
    t.integer  "stamina_before"
    t.integer  "stamina_after"
    t.string   "description"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "opponent_type"
    t.integer  "guard_id"
    t.integer  "pet_id"
    t.integer  "trap_id"
    t.integer  "user_speed"
    t.integer  "user_damage"
    t.integer  "user_block"
    t.integer  "opponent_speed"
    t.integer  "opponent_damage"
    t.integer  "opponent_block"
    t.string   "attacker"
    t.string   "defender"
  end

  create_table "pets", :force => true do |t|
    t.integer  "room_id"
    t.integer  "user_id"
    t.string   "display_name"
    t.string   "description"
    t.string   "strength"
    t.string   "weakness"
    t.string   "strength_roll"
    t.boolean  "bought"
    t.integer  "buy"
    t.integer  "sell"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "min_speed"
    t.integer  "max_speed"
    t.integer  "min_damage"
    t.integer  "max_damage"
    t.integer  "min_block"
    t.integer  "max_block"
    t.integer  "health"
    t.integer  "level"
    t.integer  "base_min_damage"
    t.integer  "base_max_damage"
    t.integer  "base_min_speed"
    t.integer  "base_max_speed"
    t.integer  "base_min_block"
    t.integer  "base_max_block"
    t.integer  "list_pet_id"
    t.integer  "base_health"
    t.integer  "hunger"
    t.integer  "color_id"
  end

  create_table "rings", :force => true do |t|
    t.integer  "user_id"
    t.boolean  "active"
    t.string   "display_name"
    t.string   "description"
    t.string   "quality"
    t.boolean  "bought"
    t.integer  "buy"
    t.integer  "sell"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "min_speed"
    t.integer  "max_speed"
    t.integer  "min_block"
    t.integer  "max_block"
    t.integer  "min_damage"
    t.integer  "max_damage"
    t.integer  "base_min_damage"
    t.integer  "base_max_damage"
    t.integer  "base_min_speed"
    t.integer  "base_max_speed"
    t.integer  "base_min_block"
    t.integer  "base_max_block"
    t.integer  "level"
    t.integer  "list_ring_id"
    t.integer  "color_id"
  end

  create_table "rooms", :force => true do |t|
    t.integer  "user_id"
    t.integer  "complex_id"
    t.integer  "guard_id"
    t.integer  "trap_id"
    t.integer  "pet_id"
    t.string   "display_name"
    t.string   "description"
    t.integer  "lock_price"
    t.integer  "buy"
    t.integer  "sell"
    t.integer  "worth"
    t.string   "image"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "level"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "sidearms", :force => true do |t|
    t.integer  "user_id"
    t.boolean  "active"
    t.string   "display_name"
    t.string   "description"
    t.string   "quality"
    t.string   "strength"
    t.string   "weakness"
    t.string   "strength_roll"
    t.boolean  "bought"
    t.integer  "buy"
    t.integer  "sell"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "min_speed"
    t.integer  "max_speed"
    t.integer  "min_damage"
    t.integer  "max_damage"
    t.integer  "min_block"
    t.integer  "max_block"
    t.integer  "base_min_damage"
    t.integer  "base_max_damage"
    t.integer  "base_min_speed"
    t.integer  "base_max_speed"
    t.integer  "base_min_block"
    t.integer  "base_max_block"
    t.integer  "level"
    t.integer  "list_sidearm_id"
    t.integer  "color_id"
  end

  create_table "traps", :force => true do |t|
    t.integer  "room_id"
    t.integer  "user_id"
    t.string   "display_name"
    t.string   "description"
    t.string   "strength"
    t.string   "weakness"
    t.string   "strength_roll"
    t.boolean  "bought"
    t.integer  "buy"
    t.integer  "sell"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "min_speed"
    t.integer  "max_speed"
    t.integer  "min_damage"
    t.integer  "max_damage"
    t.integer  "min_block"
    t.integer  "max_block"
    t.integer  "health"
    t.integer  "level"
    t.integer  "base_min_damage"
    t.integer  "base_max_damage"
    t.integer  "base_min_speed"
    t.integer  "base_max_speed"
    t.integer  "base_min_block"
    t.integer  "base_max_block"
    t.integer  "list_trap_id"
    t.integer  "base_health"
    t.integer  "durability"
    t.integer  "color_id"
  end

  create_table "users", :force => true do |t|
    t.integer  "city_id"
    t.string   "display_name"
    t.integer  "gold",                   :default => 20000
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.integer  "stamina"
    t.boolean  "admin"
    t.integer  "health"
    t.integer  "base_health"
    t.integer  "max_speed"
    t.integer  "max_block"
    t.integer  "min_speed"
    t.integer  "min_block"
    t.integer  "weapon_min_damage"
    t.integer  "weapon_max_damage"
    t.integer  "sidearm_min_damage"
    t.integer  "sidearm_max_damage"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "weapons", :force => true do |t|
    t.integer  "user_id"
    t.boolean  "active"
    t.string   "display_name"
    t.string   "description"
    t.string   "quality"
    t.string   "strength"
    t.string   "weakness"
    t.string   "strength_roll"
    t.boolean  "bought"
    t.integer  "buy"
    t.integer  "sell"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "min_speed"
    t.integer  "max_speed"
    t.integer  "min_damage"
    t.integer  "max_damage"
    t.integer  "min_block"
    t.integer  "max_block"
    t.integer  "base_min_damage"
    t.integer  "base_max_damage"
    t.integer  "base_min_speed"
    t.integer  "base_max_speed"
    t.integer  "base_min_block"
    t.integer  "base_max_block"
    t.integer  "level"
    t.integer  "list_weapon_id"
    t.integer  "color_id"
  end

end
