# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2025_08_19_125338) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contexts", force: :cascade do |t|
    t.string "style"
    t.string "request_name"
    t.string "budget"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_contexts_on_user_id"
  end

  create_table "looks", force: :cascade do |t|
    t.text "description"
    t.string "name"
    t.bigint "context_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["context_id"], name: "index_looks_on_context_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.bigint "context_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["context_id"], name: "index_messages_on_context_id"
  end

  create_table "pieces", force: :cascade do |t|
    t.string "clothing_category"
    t.string "piece_name"
    t.string "piece_description"
    t.float "price"
    t.string "brand"
    t.string "e_com_url"
    t.string "image_url"
    t.bigint "look_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["look_id"], name: "index_pieces_on_look_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.float "weight"
    t.float "height"
    t.string "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "pictures", default: [], array: true
    t.string "morphology_desc"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "contexts", "users"
  add_foreign_key "looks", "contexts"
  add_foreign_key "messages", "contexts"
  add_foreign_key "pieces", "looks"
end
