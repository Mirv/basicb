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

ActiveRecord::Schema.define(version: 20170316134046) do

  create_table "Countries", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "size"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "player_id"
    t.index ["player_id"], name: "index_countries_on_player_id"
  end

  create_table "Playercountries", force: :cascade do |t|
    t.integer  "country_id"
    t.integer  "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_playercountries_on_Country_id"
    t.index ["player_id"], name: "index_playercountries_on_Player_id"
  end

  create_table "campaigns", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "campcounts", force: :cascade do |t|
    t.integer  "campaign_id"
    t.integer  "country_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["campaign_id", "country_id"], name: "index_campcounts_on_campaign_id_and_country_id", unique: true
    t.index ["campaign_id"], name: "index_campcounts_on_campaign_id"
    t.index ["country_id"], name: "index_campcounts_on_country_id"
  end

  create_table "campplays", force: :cascade do |t|
    t.integer  "campaign_id"
    t.integer  "player_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["campaign_id"], name: "index_campplays_on_campaign_id"
    t.index ["player_id"], name: "index_campplays_on_player_id"
  end

  create_table "counties", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "state_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "dashcampaigns", force: :cascade do |t|
    t.integer  "dash_id"
    t.integer  "campaign_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["campaign_id"], name: "index_dashcampaigns_on_campaign_id"
    t.index ["dash_id"], name: "index_dashcampaigns_on_dash_id"
  end

  create_table "dashes", force: :cascade do |t|
    t.string   "name"
    t.integer  "dashcampaigns_id"
    t.integer  "dashplayers_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["dashcampaigns_id"], name: "index_dashes_on_dashcampaigns_id"
    t.index ["dashplayers_id"], name: "index_dashes_on_dashplayers_id"
  end

  create_table "dashplayers", force: :cascade do |t|
    t.integer  "dash_id"
    t.integer  "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dash_id"], name: "index_dashplayers_on_dash_id"
    t.index ["player_id"], name: "index_dashplayers_on_player_id"
  end

  create_table "neighborhoods", force: :cascade do |t|
    t.integer  "neighbor_id"
    t.integer  "target_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["neighbor_id"], name: "index_neighborhoods_on_neighbor_id"
    t.index ["target_id", "neighbor_id"], name: "index_Neighborhoods_on_target_id_and_neighbor_id", unique: true
    t.index ["target_id"], name: "index_neighborhoods_on_target_id"
  end

  create_table "players", force: :cascade do |t|
    t.string   "screenname"
    t.string   "motto"
    t.integer  "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_players_on_country_id"
  end

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "country_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "level"
    t.index ["country_id"], name: "index_states_on_country_id"
  end

  create_table "usercamps", force: :cascade do |t|
    t.integer  "campaign_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["campaign_id"], name: "index_usercamps_on_campaign_id"
    t.index ["user_id"], name: "index_usercamps_on_user_id"
  end

  create_table "userdashes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "dash_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "userplays", force: :cascade do |t|
    t.integer  "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["player_id"], name: "index_userplays_on_player_id"
    t.index ["user_id"], name: "index_userplays_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end