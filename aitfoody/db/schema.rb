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

ActiveRecord::Schema.define(version: 2018_11_02_110021) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "revarticles", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "rating"
    t.integer "price"
    t.string "keywords"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "typefood_id"
    t.string "img_path"
    t.boolean "approved", default: false
    t.string "message"
    t.index ["typefood_id"], name: "index_revarticles_on_typefood_id"
    t.index ["user_id"], name: "index_revarticles_on_user_id"
  end

  create_table "review_comments", force: :cascade do |t|
    t.bigint "revarticle_id"
    t.bigint "comment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id"], name: "index_review_comments_on_comment_id"
    t.index ["revarticle_id"], name: "index_review_comments_on_revarticle_id"
  end

  create_table "review_ingredients", force: :cascade do |t|
    t.bigint "revarticle_id"
    t.bigint "ingredient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ingredient_id"], name: "index_review_ingredients_on_ingredient_id"
    t.index ["revarticle_id"], name: "index_review_ingredients_on_revarticle_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "typefoods", force: :cascade do |t|
    t.string "name"
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
    t.bigint "role_id"
    t.string "firstname"
    t.string "lastname"
    t.string "sex"
    t.string "ban_status"
    t.boolean "active_status", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.integer "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  add_foreign_key "comments", "users"
  add_foreign_key "revarticles", "typefoods"
  add_foreign_key "revarticles", "users"
  add_foreign_key "review_comments", "comments"
  add_foreign_key "review_comments", "revarticles"
  add_foreign_key "review_ingredients", "ingredients"
  add_foreign_key "review_ingredients", "revarticles"
  add_foreign_key "users", "roles"
end
