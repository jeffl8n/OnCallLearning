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

ActiveRecord::Schema.define(version: 20140307020132) do

  create_table "comments", force: true do |t|
    t.integer  "review_cycle_id"
    t.integer  "review_id"
    t.decimal  "slide"
    t.string   "title"
    t.string   "body"
    t.boolean  "star"
    t.integer  "status"
    t.integer  "assigned_to_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "course_revisions", force: true do |t|
    t.integer  "course_id"
    t.integer  "course_revision_num",        default: 1
    t.boolean  "share_comments",             default: false
    t.datetime "expire_dt"
    t.string   "direct_upload_url",                          null: false
    t.string   "course_upload_file_name"
    t.string   "course_upload_content_type"
    t.integer  "course_upload_file_size"
    t.datetime "course_upload_updated_at"
    t.boolean  "processed",                  default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", force: true do |t|
    t.string   "title"
    t.integer  "owner_id",     null: false
    t.string   "public_id",    null: false
    t.boolean  "active"
    t.string   "link"
    t.string   "status"
    t.datetime "deleted_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "organizations", force: true do |t|
    t.string   "name"
    t.integer  "owner_id"
    t.string   "uploaded_logo_file_name"
    t.string   "uploaded_logo_content_type"
    t.integer  "uploaded_logo_file_size"
    t.datetime "uploaded_logo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", force: true do |t|
    t.integer  "course_id"
    t.integer  "course_revision_id"
    t.string   "email"
    t.string   "secret_key"
    t.integer  "cycle_num"
    t.datetime "lock_dt"
    t.datetime "complete_dt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uid"
    t.boolean  "admin",                  default: false
    t.integer  "course_count",           default: 0
    t.boolean  "active",                 default: true
    t.datetime "deleted_at"
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["uid"], name: "index_users_on_uid", unique: true

end
