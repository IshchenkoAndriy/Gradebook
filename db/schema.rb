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

ActiveRecord::Schema.define(:version => 20130112194901) do

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

  create_table "double_class_type_translations", :force => true do |t|
    t.integer  "double_class_type_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "double_class_type_translations", ["double_class_type_id"], :name => "index_double_class_type_translations_on_double_class_type_id"
  add_index "double_class_type_translations", ["locale"], :name => "index_double_class_type_translations_on_locale"

  create_table "double_class_types", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "double_classes", :force => true do |t|
    t.integer  "study_semester_id",     :null => false
    t.integer  "double_class_type_id",  :null => false
    t.integer  "subject_id",            :null => false
    t.integer  "teacher_id",            :null => false
    t.integer  "numerator_denominator"
    t.integer  "subgroup"
    t.string   "double_class_number"
    t.integer  "day_of_week"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "group_translations", :force => true do |t|
    t.integer  "group_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "group_translations", ["group_id"], :name => "index_group_translations_on_group_id"
  add_index "group_translations", ["locale"], :name => "index_group_translations_on_locale"

  create_table "groups", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "marks", :force => true do |t|
    t.integer  "student_id",        :null => false
    t.integer  "study_type_id",     :null => false
    t.integer  "double_class_id",   :null => false
    t.date     "date",              :null => false
    t.integer  "mark",              :null => false
    t.integer  "scores",            :null => false
    t.integer  "study_number"
    t.string   "study_description"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "people", :force => true do |t|
    t.string   "first_name",                        :null => false
    t.string   "second_name",                       :null => false
    t.string   "patronymic",                        :null => false
    t.string   "birth_day",         :default => "", :null => false
    t.string   "phone",             :default => "", :null => false
    t.string   "email",             :default => "", :null => false
    t.integer  "science_degree_id"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.string   "type",                              :null => false
  end

  create_table "person_translations", :force => true do |t|
    t.integer  "person_id"
    t.string   "locale"
    t.string   "first_name"
    t.string   "second_name"
    t.string   "patronymic"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "person_translations", ["locale"], :name => "index_person_translations_on_locale"
  add_index "person_translations", ["person_id"], :name => "index_person_translations_on_person_id"

  create_table "presences", :force => true do |t|
    t.integer  "student_id",      :null => false
    t.integer  "double_class_id", :null => false
    t.date     "date",            :null => false
    t.boolean  "was_present",     :null => false
    t.integer  "scores",          :null => false
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "science_degree_translations", :force => true do |t|
    t.integer  "science_degree_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "science_degree_translations", ["locale"], :name => "index_science_degree_translations_on_locale"
  add_index "science_degree_translations", ["science_degree_id"], :name => "index_science_degree_translations_on_science_degree_id"

  create_table "science_degrees", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "semester_type_translations", :force => true do |t|
    t.integer  "semester_type_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "semester_type_translations", ["locale"], :name => "index_semester_type_translations_on_locale"
  add_index "semester_type_translations", ["semester_type_id"], :name => "index_semester_type_translations_on_semester_type_id"

  create_table "semester_types", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "semesters", :force => true do |t|
    t.date     "begin_date",       :null => false
    t.date     "end_date",         :null => false
    t.integer  "semester_type_id", :null => false
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "students_in_groups", :force => true do |t|
    t.integer  "study_semester_id"
    t.integer  "student_id"
    t.boolean  "scholarship",       :default => false, :null => false
    t.boolean  "hostel",            :default => false, :null => false
    t.integer  "subgroup",          :default => 0,     :null => false
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

  create_table "study_semesters", :force => true do |t|
    t.integer  "semester_id", :null => false
    t.integer  "group_id",    :null => false
    t.integer  "teacher_id",  :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "study_type_translations", :force => true do |t|
    t.integer  "study_type_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "study_type_translations", ["locale"], :name => "index_study_type_translations_on_locale"
  add_index "study_type_translations", ["study_type_id"], :name => "index_study_type_translations_on_study_type_id"

  create_table "study_types", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "subject_type_translations", :force => true do |t|
    t.integer  "subject_type_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "subject_type_translations", ["locale"], :name => "index_subject_type_translations_on_locale"
  add_index "subject_type_translations", ["subject_type_id"], :name => "index_subject_type_translations_on_subject_type_id"

  create_table "subject_types", :force => true do |t|
    t.string   "name",                          :null => false
    t.boolean  "is_rated",   :default => false, :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
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
