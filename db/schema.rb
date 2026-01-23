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

ActiveRecord::Schema[8.1].define(version: 2025_11_28_141823) do
  create_table "colors", force: :cascade do |t|
    t.string "rgb_hash"
    t.index ["id"], name: "index_colors_on_id"
    t.index ["rgb_hash"], name: "index_colors_on_rgb_hash"
  end

  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.integer "commentable_id"
    t.string "commentable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "fill_colors", force: :cascade do |t|
    t.integer "alpha"
    t.integer "color_id", null: false
    t.datetime "created_at", null: false
    t.integer "fill_id", null: false
    t.integer "stop"
    t.datetime "updated_at", null: false
    t.index ["color_id"], name: "index_fill_colors_on_color_id"
    t.index ["fill_id"], name: "index_fill_colors_on_fill_id"
  end

  create_table "fills", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.integer "origin_id"
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_fills_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "avatar"
    t.datetime "created_at", null: false
    t.string "name", default: "", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description"
    t.string "name"
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email"
    t.datetime "updated_at", null: false
  end

  create_table "swatch_fills", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "fill_id", null: false
    t.integer "swatch_id", null: false
    t.datetime "updated_at", null: false
    t.index ["fill_id"], name: "index_swatch_fills_on_fill_id"
    t.index ["swatch_id"], name: "index_swatch_fills_on_swatch_id"
  end

  create_table "swatches", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.integer "origin_id"
    t.integer "project_id"
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["project_id"], name: "index_swatches_on_project_id"
    t.index ["user_id"], name: "index_swatches_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.boolean "admin", default: false, null: false
    t.datetime "created_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "jti", null: false
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "users"
  add_foreign_key "fill_colors", "colors"
  add_foreign_key "fill_colors", "fills"
  add_foreign_key "fills", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "projects", "users"
  add_foreign_key "swatch_fills", "fills"
  add_foreign_key "swatch_fills", "swatches"
  add_foreign_key "swatches", "projects"
  add_foreign_key "swatches", "users"
end
