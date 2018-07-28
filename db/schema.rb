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

ActiveRecord::Schema.define(version: 20160814170430) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "block_codes", force: :cascade do |t|
    t.string   "language",   limit: 255
    t.text     "content"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "block_files", force: :cascade do |t|
    t.string   "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "block_photos", force: :cascade do |t|
    t.string   "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "block_texts", force: :cascade do |t|
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "block_videos", force: :cascade do |t|
    t.string   "video"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "blocks", force: :cascade do |t|
    t.string   "name"
    t.integer  "position"
    t.integer  "lecture_id"
    t.string   "blockable_type"
    t.integer  "blockable_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["blockable_type", "blockable_id"], name: "index_blocks_on_blockable_type_and_blockable_id", using: :btree
    t.index ["lecture_id"], name: "index_blocks_on_lecture_id", using: :btree
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.datetime "deleted_at"
    t.string   "domain"
    t.index ["deleted_at"], name: "index_companies_on_deleted_at", using: :btree
    t.index ["domain"], name: "index_companies_on_domain", unique: true, using: :btree
  end

  create_table "courses", force: :cascade do |t|
    t.string   "name",                  null: false
    t.integer  "company_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "aasm_state", limit: 16
    t.index ["aasm_state"], name: "index_courses_on_aasm_state", using: :btree
    t.index ["company_id"], name: "index_courses_on_company_id", using: :btree
  end

  create_table "lectures", force: :cascade do |t|
    t.string   "name"
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["course_id"], name: "index_lectures_on_course_id", using: :btree
    t.index ["deleted_at"], name: "index_lectures_on_deleted_at", using: :btree
  end

  create_table "ownerships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_ownerships_on_company_id", using: :btree
    t.index ["user_id"], name: "index_ownerships_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                                null: false
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "courses", "companies"
  add_foreign_key "ownerships", "companies"
  add_foreign_key "ownerships", "users"
end
