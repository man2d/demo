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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110408101425) do

  create_table "admin_users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "asset_groups", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assets", :force => true do |t|
    t.string   "type"
    t.integer  "assetable_id"
    t.string   "assetable_type"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
  end

  create_table "banners", :force => true do |t|
    t.string   "url"
    t.string   "image"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "blocks", :force => true do |t|
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "blog_posts", :force => true do |t|
    t.string   "title"
    t.text     "content",       :limit => 16777215
    t.integer  "user_id"
    t.integer  "blog_topic_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "announce",      :limit => 16777215
  end

  create_table "blog_topics", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "carrierwave_assets", :force => true do |t|
    t.string   "filename"
    t.integer  "item_id"
    t.integer  "asset_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "assetable_id"
    t.string   "assetable_type"
  end

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                                 :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 25
    t.string   "guid",              :limit => 10
    t.integer  "locale",            :limit => 1,  :default => 0
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "fk_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_assetable_type"
  add_index "ckeditor_assets", ["user_id"], :name => "fk_user"

  create_table "comments", :force => true do |t|
    t.string   "title",            :limit => 50,       :default => ""
    t.text     "comment",          :limit => 16777215
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "user_id"
    t.string   "role",                                 :default => "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_id"], :name => "index_comments_on_commentable_id"
  add_index "comments", ["commentable_type"], :name => "index_comments_on_commentable_type"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",                       :default => 0
    t.integer  "attempts",                       :default => 0
    t.text     "handler",    :limit => 16777215
    t.text     "last_error", :limit => 16777215
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "hints", :force => true do |t|
    t.string   "word"
    t.text     "description", :limit => 16777215
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_assigns", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_properties", :force => true do |t|
    t.integer  "property_id"
    t.integer  "item_id"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", :force => true do |t|
    t.string   "title"
    t.string   "price",           :limit => 24
    t.text     "description"
    t.string   "image_file_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_old"
    t.integer  "page_id"
    t.integer  "item_assign_id"
    t.integer  "length"
    t.boolean  "on_hand"
    t.integer  "lgth"
    t.integer  "position"
    t.integer  "mileage"
    t.integer  "year"
    t.string   "currency"
    t.integer  "user_id"
  end

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.string   "slug"
    t.text     "body"
    t.boolean  "status"
    t.string   "meta_keywords"
    t.string   "meta_description"
    t.integer  "rgt"
    t.integer  "lft"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "resource"
    t.integer  "cached_level"
    t.boolean  "menu"
    t.string   "cached_url"
    t.string   "image"
    t.text     "description"
    t.string   "pdf"
    t.integer  "position"
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.string   "announce"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "properties", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "resume_educations", :force => true do |t|
    t.integer  "edu_type"
    t.integer  "status"
    t.string   "title"
    t.string   "speciality"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "resume_id"
  end

  create_table "resume_jobs", :force => true do |t|
    t.date     "started_at"
    t.date     "finished_at"
    t.string   "title"
    t.string   "job"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "resume_id"
  end

  create_table "resumes", :force => true do |t|
    t.string   "fio"
    t.string   "email"
    t.date     "birthdate"
    t.string   "phone"
    t.text     "more",       :limit => 16777215
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "slides", :force => true do |t|
    t.string   "title"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "item_id"
    t.integer  "position"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                          :default => "", :null => false
    t.string   "encrypted_password",         :limit => 128,      :default => "", :null => false
    t.string   "password_salt",                                  :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                  :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.date     "confirmed_at"
    t.string   "confirmation_token"
    t.datetime "confirmation_token_sent_at"
    t.datetime "confirmation_sent_at"
    t.string   "user_type"
    t.datetime "locked_at"
    t.integer  "failed_attempts"
    t.string   "unlock_token"
    t.text     "about",                      :limit => 16777215
    t.string   "city"
    t.string   "phone"
    t.boolean  "receive_comments"
    t.boolean  "activated"
    t.string   "address"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
