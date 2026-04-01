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

ActiveRecord::Schema[8.1].define(version: 2026_04_01_092442) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "admin_users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.string "slug", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_categories_on_name", unique: true
    t.index ["slug"], name: "index_categories_on_slug", unique: true
  end

  create_table "contact_messages", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email", null: false
    t.text "message", null: false
    t.string "name", null: false
    t.string "source_page"
    t.integer "status", default: 0, null: false
    t.string "subject", null: false
    t.datetime "updated_at", null: false
    t.index ["created_at"], name: "index_contact_messages_on_created_at"
    t.index ["email"], name: "index_contact_messages_on_email"
    t.index ["status"], name: "index_contact_messages_on_status"
    t.check_constraint "status = ANY (ARRAY[0, 1, 2])", name: "contact_messages_status_check"
  end

  create_table "experiences", force: :cascade do |t|
    t.string "company", null: false
    t.datetime "created_at", null: false
    t.text "description"
    t.date "end_on"
    t.integer "position", default: 0, null: false
    t.bigint "profile_id", null: false
    t.string "role", null: false
    t.date "start_on"
    t.datetime "updated_at", null: false
    t.index ["profile_id", "position"], name: "index_experiences_on_profile_id_and_position"
    t.index ["profile_id", "start_on"], name: "index_experiences_on_profile_id_and_start_on"
    t.index ["profile_id"], name: "index_experiences_on_profile_id"
  end

  create_table "post_tags", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "post_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id", "tag_id"], name: "index_post_tags_on_post_id_and_tag_id", unique: true
    t.index ["post_id"], name: "index_post_tags_on_post_id"
    t.index ["tag_id"], name: "index_post_tags_on_tag_id"
  end

  create_table "posts", force: :cascade do |t|
    t.bigint "category_id"
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.text "excerpt", null: false
    t.boolean "featured", default: false, null: false
    t.text "meta_description"
    t.string "meta_title"
    t.datetime "published_at"
    t.string "slug", null: false
    t.integer "status", default: 0, null: false
    t.string "title", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_posts_on_category_id"
    t.index ["published_at"], name: "index_posts_on_published_at"
    t.index ["slug"], name: "index_posts_on_slug", unique: true
    t.index ["status", "published_at"], name: "index_posts_on_status_and_published_at"
    t.index ["status"], name: "index_posts_on_status"
    t.check_constraint "status = ANY (ARRAY[0, 1])", name: "posts_status_check"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "availability_text"
    t.string "avatar_url"
    t.text "bio"
    t.datetime "created_at", null: false
    t.string "cv_url"
    t.string "full_name", null: false
    t.string "headline"
    t.datetime "updated_at", null: false
  end

  create_table "project_achievements", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description"
    t.string "icon"
    t.integer "position", default: 0, null: false
    t.bigint "project_id", null: false
    t.string "title", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id", "position"], name: "index_project_achievements_on_project_id_and_position"
    t.index ["project_id"], name: "index_project_achievements_on_project_id"
  end

  create_table "project_links", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "kind", null: false
    t.string "label", null: false
    t.integer "position", default: 0, null: false
    t.bigint "project_id", null: false
    t.datetime "updated_at", null: false
    t.string "url", null: false
    t.index ["project_id", "kind"], name: "index_project_links_on_project_id_and_kind"
    t.index ["project_id", "position"], name: "index_project_links_on_project_id_and_position"
    t.index ["project_id"], name: "index_project_links_on_project_id"
  end

  create_table "project_metrics", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "improved_value"
    t.string "legacy_value"
    t.string "name", null: false
    t.integer "position", default: 0, null: false
    t.bigint "project_id", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id", "position"], name: "index_project_metrics_on_project_id_and_position"
    t.index ["project_id"], name: "index_project_metrics_on_project_id"
  end

  create_table "project_visuals", force: :cascade do |t|
    t.text "caption"
    t.datetime "created_at", null: false
    t.string "image_url", null: false
    t.integer "position", default: 0, null: false
    t.bigint "project_id", null: false
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["project_id", "position"], name: "index_project_visuals_on_project_id_and_position"
    t.index ["project_id"], name: "index_project_visuals_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.text "challenge"
    t.datetime "created_at", null: false
    t.boolean "featured", default: false, null: false
    t.text "meta_description"
    t.string "meta_title"
    t.datetime "published_at"
    t.string "slug", null: false
    t.text "solution"
    t.integer "status", default: 0, null: false
    t.text "summary", null: false
    t.string "title", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_projects_on_slug", unique: true
    t.index ["status", "published_at"], name: "index_projects_on_status_and_published_at"
    t.check_constraint "status = ANY (ARRAY[0, 1])", name: "projects_status_check"
  end

  create_table "skills", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "group_name", null: false
    t.string "name", null: false
    t.integer "position", default: 0, null: false
    t.bigint "profile_id", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id", "group_name", "position"], name: "index_skills_on_profile_id_and_group_name_and_position"
    t.index ["profile_id"], name: "index_skills_on_profile_id"
  end

  create_table "social_links", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "platform", null: false
    t.integer "position", default: 0, null: false
    t.bigint "profile_id", null: false
    t.datetime "updated_at", null: false
    t.string "url", null: false
    t.index ["profile_id", "platform"], name: "index_social_links_on_profile_id_and_platform", unique: true
    t.index ["profile_id", "position"], name: "index_social_links_on_profile_id_and_position"
    t.index ["profile_id"], name: "index_social_links_on_profile_id"
  end

  create_table "tags", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.string "slug", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_tags_on_name", unique: true
    t.index ["slug"], name: "index_tags_on_slug", unique: true
  end

  add_foreign_key "experiences", "profiles", on_delete: :cascade
  add_foreign_key "post_tags", "posts", on_delete: :cascade
  add_foreign_key "post_tags", "tags", on_delete: :cascade
  add_foreign_key "posts", "categories", on_delete: :nullify
  add_foreign_key "project_achievements", "projects", on_delete: :cascade
  add_foreign_key "project_links", "projects", on_delete: :cascade
  add_foreign_key "project_metrics", "projects", on_delete: :cascade
  add_foreign_key "project_visuals", "projects", on_delete: :cascade
  add_foreign_key "skills", "profiles", on_delete: :cascade
  add_foreign_key "social_links", "profiles", on_delete: :cascade
end
