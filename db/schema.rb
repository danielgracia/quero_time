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

ActiveRecord::Schema.define(version: 20170528044909) do

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invitations", force: :cascade do |t|
    t.string "state"
    t.integer "users_id"
    t.integer "teams_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["teams_id"], name: "index_invitations_on_teams_id"
    t.index ["users_id"], name: "index_invitations_on_users_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "information"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_skills", force: :cascade do |t|
    t.integer "level"
    t.integer "users_id"
    t.integer "skills_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["skills_id"], name: "index_user_skills_on_skills_id"
    t.index ["users_id"], name: "index_user_skills_on_users_id"
  end

  create_table "users", primary_key: "slack_id", id: :string, force: :cascade do |t|
    t.string "oauth_token"
    t.string "name"
    t.string "email"
    t.string "avatar"
    t.integer "lock_version"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slack_id"], name: "sqlite_autoindex_users_1", unique: true
  end

end
