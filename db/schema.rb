# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20081229061452) do

  create_table "activities", :force => true do |t|
    t.integer  "person_id"
    t.integer  "event_id"
    t.text     "description", :limit => 16777215
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "articles", :force => true do |t|
    t.integer  "publication_id"
    t.string   "journal_title"
    t.string   "journal_title_ja"
    t.integer  "volume"
    t.integer  "issue"
    t.integer  "start_page"
    t.integer  "end_page"
    t.date     "publication_date"
    t.string   "publisher"
    t.string   "address"
    t.text     "abstract",         :limit => 16777215
    t.text     "abstract_ja",      :limit => 16777215
    t.boolean  "is_invited"
    t.boolean  "is_review"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "authorships", :force => true do |t|
    t.integer  "person_id"
    t.integer  "publication_id"
    t.integer  "priority"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "books", :force => true do |t|
    t.integer  "publication_id"
    t.string   "editors"
    t.date     "publication_date"
    t.string   "publisher"
    t.string   "address"
    t.string   "edition"
    t.string   "series"
    t.string   "isbn"
    t.text     "abstract",         :limit => 16777215
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "conferences", :force => true do |t|
    t.integer  "event_id"
    t.integer  "publication_id"
    t.string   "proceedings_title"
    t.string   "proceedings_title_ja"
    t.integer  "start_page"
    t.integer  "end_page"
    t.text     "abstract",             :limit => 16777215
    t.text     "abstract_ja",          :limit => 16777215
    t.boolean  "is_invited"
    t.boolean  "is_review"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_types", :force => true do |t|
    t.string   "name"
    t.string   "name_ja"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.integer  "event_type_id"
    t.string   "name"
    t.string   "name_ja"
    t.string   "location"
    t.string   "organization"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "abbreviation"
    t.integer  "number"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.string   "name_ja"
    t.text     "description",    :limit => 16777215
    t.text     "description_ja", :limit => 16777215
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inbooks", :force => true do |t|
    t.integer  "publication_id"
    t.string   "book_title"
    t.string   "book_title_ja"
    t.string   "editors"
    t.string   "isbn"
    t.date     "publication_date"
    t.string   "publisher"
    t.string   "address"
    t.integer  "start_page"
    t.integer  "end_page"
    t.string   "edition"
    t.string   "series"
    t.text     "abstract",         :limit => 16777215
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "memberships", :force => true do |t|
    t.integer  "person_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "miscs", :force => true do |t|
    t.integer  "publication_id"
    t.text     "description",    :limit => 16777215
    t.text     "description_ja", :limit => 16777215
    t.string   "url"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", :force => true do |t|
    t.string   "first_name"
    t.string   "first_name_ja"
    t.string   "last_name"
    t.string   "last_name_ja"
    t.string   "mail"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_groups", :force => true do |t|
    t.integer  "project_id"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.string   "name_ja"
    t.text     "description",    :limit => 16777215
    t.text     "description_ja", :limit => 16777215
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "publication_file_types", :force => true do |t|
    t.string   "description"
    t.string   "description_ja"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "publication_files", :force => true do |t|
    t.integer  "publication_id"
    t.integer  "publication_file_type_id"
    t.string   "url"
    t.string   "description"
    t.integer  "size"
    t.string   "content_type"
    t.string   "filename"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "publication_materials", :force => true do |t|
    t.integer  "publication_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "publication_media", :force => true do |t|
    t.integer  "publication_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "publication_projects", :force => true do |t|
    t.integer  "publication_id"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "publications", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.string   "title_ja"
    t.date     "year"
    t.string   "publication_type"
  end

  create_table "techreports", :force => true do |t|
    t.integer  "publication_id"
    t.date     "publication_date"
    t.string   "publisher"
    t.string   "address"
    t.string   "edition"
    t.string   "series"
    t.integer  "number"
    t.text     "abstract",         :limit => 16777215
    t.text     "abstract_ja",      :limit => 16777215
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "theses", :force => true do |t|
    t.integer  "publication_id"
    t.string   "degree"
    t.date     "publication_date"
    t.string   "school"
    t.string   "address"
    t.text     "abstract",         :limit => 16777215
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
  end

end
