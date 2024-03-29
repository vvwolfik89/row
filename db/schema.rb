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

ActiveRecord::Schema.define(version: 20210319165559) do

  create_table "athletes_current_coach", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.bigint "refinery_coach_id", null: false
    t.bigint "refinery_athlete_id", null: false
    t.index ["refinery_athlete_id"], name: "index_athletes_current_coach_on_refinery_athlete_id"
    t.index ["refinery_coach_id"], name: "index_athletes_current_coach_on_refinery_coach_id"
  end

  create_table "athletes_first_coach", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.bigint "refinery_coach_id", null: false
    t.bigint "refinery_athlete_id", null: false
    t.index ["refinery_athlete_id"], name: "index_athletes_first_coach_on_refinery_athlete_id"
    t.index ["refinery_coach_id"], name: "index_athletes_first_coach_on_refinery_coach_id"
  end

  create_table "data_emails", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email"
    t.text "text"
    t.string "address"
    t.integer "type_of_email"
    t.string "unp"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "refinery_album_pages", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "album_id"
    t.integer "page_id"
    t.string "page_type", default: "Refinery::Page"
    t.index ["album_id"], name: "index_refinery_album_pages_on_album_id"
    t.index ["page_id"], name: "index_refinery_album_pages_on_page_id"
  end

  create_table "refinery_athlete_translations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "refinery_athlete_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "patronymic"
    t.string "territorial_unit"
    t.string "educational_institution"
    t.string "organisation"
    t.string "first_organisation"
    t.text "description"
    t.index ["locale"], name: "index_refinery_athlete_translations_on_locale"
    t.index ["refinery_athlete_id"], name: "index_refinery_athlete_translations_on_refinery_athlete_id"
  end

  create_table "refinery_athletes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "patronymic"
    t.date "bday"
    t.integer "rowing_type"
    t.string "territorial_unit"
    t.string "educational_institution"
    t.string "organisation"
    t.string "first_organisation"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "icon_id"
    t.integer "gender", default: 0
    t.boolean "is_active", default: false
    t.text "description"
    t.string "url_instagram"
  end

  create_table "refinery_authentication_devise_roles", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "title"
  end

  create_table "refinery_authentication_devise_roles_users", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["role_id", "user_id"], name: "refinery_roles_users_role_id_user_id"
    t.index ["user_id", "role_id"], name: "refinery_roles_users_user_id_role_id"
  end

  create_table "refinery_authentication_devise_user_plugins", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "user_id"
    t.string "name"
    t.integer "position"
    t.index ["name"], name: "index_refinery_authentication_devise_user_plugins_on_name"
    t.index ["user_id", "name"], name: "refinery_user_plugins_user_id_name", unique: true
  end

  create_table "refinery_authentication_devise_users", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "username", null: false
    t.string "email", null: false
    t.string "encrypted_password", null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.integer "sign_in_count"
    t.datetime "remember_created_at"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "slug"
    t.string "full_name"
    t.index ["id"], name: "index_refinery_authentication_devise_users_on_id"
    t.index ["slug"], name: "index_refinery_authentication_devise_users_on_slug"
  end

  create_table "refinery_coach_translations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "refinery_coach_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "patronymic"
    t.text "description"
    t.string "pre_position"
    t.index ["locale"], name: "index_refinery_coach_translations_on_locale"
    t.index ["refinery_coach_id"], name: "index_refinery_coach_translations_on_refinery_coach_id"
  end

  create_table "refinery_coaches", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "patronymic"
    t.date "bday"
    t.integer "rowing_type"
    t.integer "icon_id"
    t.text "description"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "type_of_staff"
    t.boolean "is_active", default: false
    t.boolean "national_coach", default: true
    t.string "pre_position"
  end

  create_table "refinery_competition_translations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "refinery_competition_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.text "description"
    t.string "country"
    t.string "city"
    t.index ["locale"], name: "index_refinery_competition_translations_on_locale"
    t.index ["refinery_competition_id"], name: "index_be55ee4083c86807bf29e7cc9b74170c9388d2f1"
  end

  create_table "refinery_competitions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "title"
    t.text "description"
    t.integer "image_id"
    t.integer "type_of_competition"
    t.integer "location"
    t.date "date_of_competition"
    t.string "country"
    t.string "city"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "refinery_department_translations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "refinery_department_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.text "description"
    t.index ["locale"], name: "index_refinery_department_translations_on_locale"
    t.index ["refinery_department_id"], name: "index_e7a1df3e8d677cdefff35054cdb105feb591303d"
  end

  create_table "refinery_departments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "title"
    t.integer "icon_id"
    t.text "description"
    t.boolean "is_active"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "refinery_departments_employees", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.bigint "refinery_employee_id", null: false
    t.bigint "refinery_department_id", null: false
    t.index ["refinery_department_id"], name: "index_refinery_departments_employees_on_refinery_department_id"
    t.index ["refinery_employee_id"], name: "index_refinery_departments_employees_on_refinery_employee_id"
  end

  create_table "refinery_employee_translations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "refinery_employee_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "patronymic"
    t.string "education"
    t.text "description"
    t.string "pre_position"
    t.index ["locale"], name: "index_refinery_employee_translations_on_locale"
    t.index ["refinery_employee_id"], name: "index_refinery_employee_translations_on_refinery_employee_id"
  end

  create_table "refinery_employees", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "patronymic"
    t.integer "employee_type"
    t.integer "type_education"
    t.string "education"
    t.string "phone"
    t.date "bdate"
    t.text "description"
    t.date "beginning_work_at"
    t.integer "icon_id"
    t.boolean "is_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position"
    t.string "pre_position"
  end

  create_table "refinery_image_translations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "refinery_image_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_alt"
    t.string "image_title"
    t.index ["locale"], name: "index_refinery_image_translations_on_locale"
    t.index ["refinery_image_id"], name: "index_refinery_image_translations_on_refinery_image_id"
  end

  create_table "refinery_images", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "image_mime_type"
    t.string "image_name"
    t.integer "image_size"
    t.integer "image_width"
    t.integer "image_height"
    t.string "image_uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "refinery_item_translations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "refinery_item_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.text "content"
    t.text "description"
    t.index ["locale"], name: "index_refinery_item_translations_on_locale"
    t.index ["refinery_item_id"], name: "index_refinery_item_translations_on_refinery_item_id"
  end

  create_table "refinery_items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "title"
    t.datetime "date_start"
    t.datetime "date_end"
    t.integer "icon_id"
    t.text "content"
    t.text "description"
    t.integer "position"
    t.integer "type_news"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "refinery_page_part_translations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "refinery_page_part_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "body"
    t.index ["locale"], name: "index_refinery_page_part_translations_on_locale"
    t.index ["refinery_page_part_id"], name: "index_refinery_page_part_translations_on_refinery_page_part_id"
  end

  create_table "refinery_page_parts", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "refinery_page_id"
    t.string "slug"
    t.integer "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "title"
    t.index ["id"], name: "index_refinery_page_parts_on_id"
    t.index ["refinery_page_id"], name: "index_refinery_page_parts_on_refinery_page_id"
  end

  create_table "refinery_page_translations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "refinery_page_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.string "custom_slug"
    t.string "menu_title"
    t.string "slug"
    t.index ["locale"], name: "index_refinery_page_translations_on_locale"
    t.index ["refinery_page_id"], name: "index_refinery_page_translations_on_refinery_page_id"
  end

  create_table "refinery_pages", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "parent_id"
    t.string "path"
    t.boolean "show_in_menu", default: true
    t.string "link_url"
    t.string "menu_match"
    t.boolean "deletable", default: true
    t.boolean "draft", default: false
    t.boolean "skip_to_first_child", default: false
    t.integer "lft"
    t.integer "rgt"
    t.integer "depth"
    t.string "view_template"
    t.string "layout_template"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "children_count", default: 0, null: false
    t.boolean "show_in_footer", default: false
    t.index ["depth"], name: "index_refinery_pages_on_depth"
    t.index ["id"], name: "index_refinery_pages_on_id"
    t.index ["lft"], name: "index_refinery_pages_on_lft"
    t.index ["parent_id"], name: "index_refinery_pages_on_parent_id"
    t.index ["rgt"], name: "index_refinery_pages_on_rgt"
  end

  create_table "refinery_partner_translations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "refinery_partner_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.text "description"
    t.index ["locale"], name: "index_refinery_partner_translations_on_locale"
    t.index ["refinery_partner_id"], name: "index_refinery_partner_translations_on_refinery_partner_id"
  end

  create_table "refinery_partners", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "title"
    t.integer "icon_id"
    t.text "description"
    t.boolean "is_active"
    t.string "url_address"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "refinery_photo_gallery_albums", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "title", null: false
    t.text "description"
    t.string "path"
    t.string "address"
    t.decimal "longitude", precision: 15, scale: 10
    t.decimal "latitude", precision: 15, scale: 10
    t.text "note"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["id"], name: "index_refinery_photo_gallery_albums_on_id", unique: true
  end

  create_table "refinery_photo_gallery_collection_albums", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "collection_id"
    t.integer "album_id"
    t.index ["album_id"], name: "index_rpg_collection_albums_on_album_id"
    t.index ["collection_id"], name: "index_rpg_collection_albums_on_collection_id"
  end

  create_table "refinery_photo_gallery_collections", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "title", null: false
    t.text "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["id"], name: "index_refinery_photo_gallery_collections_on_id", unique: true
  end

  create_table "refinery_photo_gallery_photos", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "title", null: false
    t.text "description"
    t.string "path"
    t.decimal "longitude", precision: 15, scale: 10
    t.decimal "latitude", precision: 15, scale: 10
    t.string "file"
    t.integer "album_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "url"
    t.string "css_class"
    t.string "preview_type"
    t.index ["album_id"], name: "index_refinery_photo_gallery_photos_on_album_id"
    t.index ["id"], name: "index_refinery_photo_gallery_photos_on_id", unique: true
  end

  create_table "refinery_preview_translations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "refinery_preview_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.text "description"
    t.index ["locale"], name: "index_refinery_preview_translations_on_locale"
    t.index ["refinery_preview_id"], name: "index_refinery_preview_translations_on_refinery_preview_id"
  end

  create_table "refinery_previews", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "title"
    t.integer "icon_id"
    t.text "description"
    t.boolean "is_active"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "refinery_resource_translations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "refinery_resource_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "resource_title"
    t.index ["locale"], name: "index_refinery_resource_translations_on_locale"
    t.index ["refinery_resource_id"], name: "index_refinery_resource_translations_on_refinery_resource_id"
  end

  create_table "refinery_resources", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "file_mime_type"
    t.string "file_name"
    t.integer "file_size"
    t.string "file_uid"
    t.string "file_ext"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "refinery_service_translations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "refinery_service_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.text "description"
    t.integer "coast"
    t.index ["locale"], name: "index_refinery_service_translations_on_locale"
    t.index ["refinery_service_id"], name: "index_refinery_service_translations_on_refinery_service_id"
  end

  create_table "refinery_services", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "title"
    t.integer "kind"
    t.integer "icon_id"
    t.text "description"
    t.string "short_name"
    t.integer "coast"
    t.boolean "show_inline"
    t.boolean "is_active"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "coast_value"
  end

  create_table "refinery_sport_rowing_translations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "refinery_sport_rowing_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.text "description"
    t.index ["locale"], name: "index_refinery_sport_rowing_translations_on_locale"
    t.index ["refinery_sport_rowing_id"], name: "index_0e144cf97034f160d1bfd3cb1d24334ab0a2fe69"
  end

  create_table "refinery_sport_rowings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "title"
    t.integer "kind"
    t.integer "icon_id"
    t.text "description"
    t.string "short_name"
    t.integer "count_athletes"
    t.boolean "is_active"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "results", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "title"
    t.string "located"
    t.date "start_date"
    t.text "description"
    t.integer "place"
    t.integer "athlete_id"
    t.string "locale"
  end

  create_table "seo_meta", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "seo_meta_id"
    t.string "seo_meta_type"
    t.string "browser_title"
    t.text "meta_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_seo_meta_on_id"
    t.index ["seo_meta_id", "seo_meta_type"], name: "id_type_index_on_seo_meta"
  end

end
