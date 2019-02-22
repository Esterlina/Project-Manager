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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20190222150220) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "has_projects", force: :cascade do |t|
    t.integer "project_id"
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "has_projects", ["project_id"], name: "index_has_projects_on_project_id", using: :btree
  add_index "has_projects", ["role_id"], name: "index_has_projects_on_role_id", using: :btree
  add_index "has_projects", ["user_id"], name: "index_has_projects_on_user_id", using: :btree

  create_table "has_services", force: :cascade do |t|
    t.integer "project_id"
    t.integer "service_id"
  end

  add_index "has_services", ["project_id"], name: "index_has_services_on_project_id", using: :btree
  add_index "has_services", ["service_id"], name: "index_has_services_on_service_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "number_sprints"
    t.date     "starting_date"
    t.date     "ending_date"
    t.string   "detail"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "code"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
  end

  create_table "types", force: :cascade do |t|
    t.string "user_type"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "type_id"
    t.string   "alias"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "has_projects", "projects"
  add_foreign_key "has_projects", "roles"
  add_foreign_key "has_projects", "users"
  add_foreign_key "has_services", "projects"
  add_foreign_key "has_services", "services"
  add_foreign_key "users", "types"
end
