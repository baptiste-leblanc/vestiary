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

ActiveRecord::Schema[7.1].define(version: 2025_08_19_140414) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contexts", force: :cascade do |t|
    t.string "objective"
    t.string "request_name"
    t.string "budget"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_contexts_on_user_id"
  end

  create_table "look_pieces", force: :cascade do |t|
    t.bigint "look_id", null: false
    t.bigint "piece_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["look_id"], name: "index_look_pieces_on_look_id"
    t.index ["piece_id"], name: "index_look_pieces_on_piece_id"
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
    t.string "name"
    t.text "description"
    t.integer "price"
    t.string "brand"
    t.string "shop_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.float "weight"
    t.float "height"
    t.string "gender"
    t.string "morphology"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "contexts", "users"
  add_foreign_key "look_pieces", "looks"
  add_foreign_key "look_pieces", "pieces"
  add_foreign_key "looks", "contexts"
  add_foreign_key "messages", "contexts"
end
