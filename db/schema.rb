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

ActiveRecord::Schema.define(version: 2023_06_03_135823) do

  create_table "comments", force: :cascade do |t|
    t.string "content"
    t.integer "user_id", null: false
    t.integer "potato_id", null: false
    t.integer "oimo_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["oimo_id"], name: "index_comments_on_oimo_id"
    t.index ["potato_id"], name: "index_comments_on_potato_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "oimo_id", null: false
    t.integer "potato_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["oimo_id"], name: "index_likes_on_oimo_id"
    t.index ["potato_id"], name: "index_likes_on_potato_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "oimos", force: :cascade do |t|
    t.string "shop_name"
    t.string "shop_or_recipe"
    t.string "adresses"
    t.text "shop_about"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image"
    t.integer "user_id"
  end

  create_table "potatos", force: :cascade do |t|
    t.string "recipe_name"
    t.string "recipe_about"
    t.string "recipe_image"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tag_maps", force: :cascade do |t|
    t.integer "oimo_id", null: false
    t.integer "potato_id", null: false
    t.integer "tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["oimo_id"], name: "index_tag_maps_on_oimo_id"
    t.index ["potato_id"], name: "index_tag_maps_on_potato_id"
    t.index ["tag_id"], name: "index_tag_maps_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "tag_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.text "profile"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "oimos"
  add_foreign_key "comments", "potatos"
  add_foreign_key "comments", "users"
  add_foreign_key "likes", "oimos"
  add_foreign_key "likes", "potatos"
  add_foreign_key "likes", "users"
  add_foreign_key "tag_maps", "oimos"
  add_foreign_key "tag_maps", "potatos"
  add_foreign_key "tag_maps", "tags"
end
