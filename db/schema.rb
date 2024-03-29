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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130610223500) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "articles", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "text"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "double_class_types", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "double_classes", :force => true do |t|
    t.integer  "study_group_id",       :null => false
    t.integer  "double_class_type_id", :null => false
    t.integer  "subject_id",           :null => false
    t.integer  "teacher_id",           :null => false
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.integer  "presence_score",       :null => false
  end

  create_table "groups", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "lessons", :force => true do |t|
    t.integer  "double_class_id", :null => false
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "description",     :null => false
  end

  create_table "marks", :force => true do |t|
    t.integer  "student_id",        :null => false
    t.integer  "study_type_id"
    t.integer  "double_class_id"
    t.date     "date",              :null => false
    t.integer  "score",             :null => false
    t.integer  "study_number"
    t.string   "study_description"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "lesson_id"
    t.string   "type",              :null => false
    t.integer  "module",            :null => false
  end

  create_table "people", :force => true do |t|
    t.string   "first_name",                 :null => false
    t.string   "last_name",                  :null => false
    t.string   "patronymic",                 :null => false
    t.string   "birth_day",  :default => "", :null => false
    t.string   "phone",      :default => "", :null => false
    t.string   "email",      :default => "", :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.string   "type",                       :null => false
  end

  create_table "presences", :force => true do |t|
    t.integer  "student_id",  :null => false
    t.integer  "lesson_id",   :null => false
    t.boolean  "was_present", :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "module",      :null => false
    t.date     "date"
  end

  create_table "relationships", :force => true do |t|
    t.integer  "student_id", :null => false
    t.integer  "parent_id",  :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "schedules", :force => true do |t|
    t.integer  "double_class_id",       :null => false
    t.integer  "numerator_denominator", :null => false
    t.integer  "subgroup",              :null => false
    t.integer  "double_class_number",   :null => false
    t.integer  "day_of_week",           :null => false
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.integer  "classroom_number"
  end

  create_table "semesters", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "year",       :null => false
    t.string   "title",      :null => false
  end

  create_table "slides", :force => true do |t|
    t.string   "caption"
    t.string   "url"
    t.boolean  "active"
    t.integer  "position"
    t.integer  "width"
    t.integer  "height"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "students_in_groups", :force => true do |t|
    t.integer  "study_group_id",                    :null => false
    t.integer  "student_id",                        :null => false
    t.boolean  "scholarship",    :default => false, :null => false
    t.boolean  "hostel",         :default => false, :null => false
    t.integer  "subgroup",       :default => 0,     :null => false
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  create_table "study_groups", :force => true do |t|
    t.integer  "semester_id", :null => false
    t.integer  "group_id",    :null => false
    t.integer  "teacher_id",  :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "study_types", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "subject_types", :force => true do |t|
    t.string   "name",                          :null => false
    t.boolean  "is_rated",   :default => false, :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "subjects", :force => true do |t|
    t.string   "name",            :null => false
    t.integer  "subject_type_id", :null => false
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "capabilities_mask",      :default => 0
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
