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

ActiveRecord::Schema.define(version: 20180124093050) do

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "author", default: "A.J. Norton"
    t.boolean "published", default: false
    t.date "written_at_date"
    t.string "header_image", default: "logo.png"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "draft_comments_count", default: 0
    t.integer "published_comments_count", default: 0
    t.integer "deleted_comments_count", default: 0
    t.text "useful_links"
    t.text "people_mentioned"
    t.text "timestamp"
    t.text "embedded_link"
    t.string "slug"
    t.string "media", default: "podcast"
    t.index ["slug"], name: "index_articles_on_slug", unique: true
  end

  create_table "comments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "holder_id"
    t.integer "commentable_id"
    t.string "commentable_type"
    t.string "commentable_url"
    t.string "commentable_title"
    t.string "commentable_state"
    t.string "anchor"
    t.string "title"
    t.string "contacts"
    t.text "raw_content"
    t.text "content"
    t.string "view_token"
    t.string "state", default: "draft"
    t.string "ip", default: "undefined"
    t.string "referer", default: "undefined"
    t.string "user_agent", default: "undefined"
    t.integer "tolerance_time"
    t.boolean "spam", default: false
    t.integer "parent_id"
    t.integer "lft"
    t.integer "rgt"
    t.integer "depth", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "taggings", force: :cascade do |t|
    t.integer "tag_id"
    t.string "taggable_type"
    t.integer "taggable_id"
    t.string "tagger_type"
    t.integer "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.boolean "subscribed", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "my_draft_comments_count", default: 0
    t.integer "my_published_comments_count", default: 0
    t.integer "my_comments_count", default: 0
    t.integer "draft_comcoms_count", default: 0
    t.integer "published_comcoms_count", default: 0
    t.integer "deleted_comcoms_count", default: 0
    t.integer "spam_comcoms_count", default: 0
  end

end
