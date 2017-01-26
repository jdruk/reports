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

ActiveRecord::Schema.define(version: 20170126185159) do

  create_table "audits", force: :cascade do |t|
    t.integer  "auditable_id"
    t.string   "auditable_type"
    t.integer  "associated_id"
    t.string   "associated_type"
    t.integer  "user_id"
    t.string   "user_type"
    t.string   "username"
    t.string   "action"
    t.text     "audited_changes"
    t.integer  "version",         default: 0
    t.string   "comment"
    t.string   "remote_address"
    t.string   "request_uuid"
    t.datetime "created_at"
  end

  add_index "audits", ["associated_id", "associated_type"], name: "associated_index"
  add_index "audits", ["auditable_id", "auditable_type"], name: "auditable_index"
  add_index "audits", ["created_at"], name: "index_audits_on_created_at"
  add_index "audits", ["request_uuid"], name: "index_audits_on_request_uuid"
  add_index "audits", ["user_id", "user_type"], name: "user_index"

  create_table "districts", force: :cascade do |t|
    t.integer  "district_id"
    t.string   "name"
    t.string   "public_place"
    t.string   "city"
    t.string   "state"
    t.string   "cep"
    t.string   "phone"
    t.string   "email"
    t.string   "neighborhood"
    t.string   "second_phone"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "districts", ["district_id"], name: "index_districts_on_district_id"

  create_table "group_permissions", force: :cascade do |t|
    t.integer  "user_group_id"
    t.integer  "segment_id"
    t.integer  "permission_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "group_permissions", ["permission_id"], name: "index_group_permissions_on_permission_id"
  add_index "group_permissions", ["segment_id"], name: "index_group_permissions_on_segment_id"
  add_index "group_permissions", ["user_group_id"], name: "index_group_permissions_on_user_group_id"

  create_table "image_reports", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "avatar"
  end

  create_table "people", force: :cascade do |t|
    t.string   "name"
    t.string   "rg"
    t.string   "cpf"
    t.integer  "gender"
    t.string   "phone"
    t.string   "cell_phone"
    t.string   "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "permissions", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "question_resquest_criminals", force: :cascade do |t|
    t.integer  "question_id"
    t.integer  "resquest_criminal_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "question_resquest_criminals", ["question_id"], name: "index_question_resquest_criminals_on_question_id"
  add_index "question_resquest_criminals", ["resquest_criminal_id"], name: "index_question_resquest_criminals_on_resquest_criminal_id"

  create_table "questions", force: :cascade do |t|
    t.integer  "type"
    t.text     "description"
    t.boolean  "default"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "reports", force: :cascade do |t|
    t.integer  "resquest_criminal_id"
    t.integer  "user_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "reports", ["resquest_criminal_id"], name: "index_reports_on_resquest_criminal_id"
  add_index "reports", ["user_id"], name: "index_reports_on_user_id"

  create_table "resquest_criminals", force: :cascade do |t|
    t.integer  "district_resquest"
    t.integer  "district_send"
    t.integer  "user_id"
    t.integer  "type"
    t.integer  "person_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "resquest_criminals", ["person_id"], name: "index_resquest_criminals_on_person_id"
  add_index "resquest_criminals", ["user_id"], name: "index_resquest_criminals_on_user_id"

  create_table "segments", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "user_groups", force: :cascade do |t|
    t.string   "description"
    t.integer  "level"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "function",    default: 0
  end

  create_table "user_permissions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "segment_id"
    t.integer  "permission_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "user_permissions", ["permission_id"], name: "index_user_permissions_on_permission_id"
  add_index "user_permissions", ["segment_id"], name: "index_user_permissions_on_segment_id"
  add_index "user_permissions", ["user_id"], name: "index_user_permissions_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "user_group_id",          default: 0
    t.integer  "district_id"
    t.string   "registration"
    t.datetime "date_registration"
    t.boolean  "approved",               default: false, null: false
    t.string   "name"
  end

  add_index "users", ["approved"], name: "index_users_on_approved"
  add_index "users", ["district_id"], name: "index_users_on_district_id"
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["user_group_id"], name: "index_users_on_user_group_id"

end
