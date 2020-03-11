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

ActiveRecord::Schema.define(version: 2020_03_10_162909) do

  create_table "Address", primary_key: "address_ID", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "type_of_address", null: false
    t.text "status", null: false
    t.text "entity", null: false
    t.string "number_n_street", null: false
    t.string "suite_or_apt", limit: 5, null: false
    t.string "city", limit: 20, null: false
    t.string "postal_code", limit: 7, null: false
    t.string "country", limit: 20, null: false
    t.text "notes", null: false
  end

  create_table "Batteries", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "battery_ID", null: false
    t.integer "building_ID", null: false
    t.string "battery_type", limit: 50, null: false
    t.text "status", null: false
    t.integer "employee_ID", null: false
    t.date "date_commision", null: false
    t.date "date_last_inspect", null: false
    t.binary "certificate_operations", null: false
    t.text "info", null: false
    t.text "notes", null: false
    t.index ["building_ID"], name: "Batteries_fk0"
    t.index ["employee_ID"], name: "Batteries_fk1"
  end

  create_table "BuildingDetails", primary_key: "buildingdetail_ID", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "building_ID", null: false
    t.binary "info_key", null: false
    t.binary "value", null: false
    t.index ["building_ID"], name: "BuildingDetails_fk0"
  end

  create_table "Buildings", primary_key: "building_ID", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "address_ID", null: false
    t.integer "customer_ID", null: false
    t.string "full_name_building_admin", null: false
    t.string "admin_email", null: false
    t.string "admin_phone", limit: 10, null: false
    t.string "full_name_tech_contact", null: false
    t.string "tech_email", null: false
    t.string "tech_phone", limit: 10, null: false
    t.index ["address_ID"], name: "Buildings_fk0"
    t.index ["customer_ID"], name: "Buildings_fk1"
  end

  create_table "Columns", primary_key: "column_ID", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "battery_ID", null: false
    t.string "column_type", limit: 50, null: false
    t.integer "number_floors", null: false
    t.string "status", null: false
    t.text "info", null: false
    t.text "notes", null: false
  end

  create_table "Customers", primary_key: "customer_ID", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.timestamp "customer_create_date", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "company_name", null: false
    t.string "company_hq_addr_ID", null: false
    t.string "name_company_contact", null: false
    t.string "company_phone", limit: 11, null: false
    t.string "contact_email", null: false
    t.text "company_desc", null: false
    t.string "full_name_STA", null: false
    t.string "tech_authority_phone", limit: 11, null: false
    t.string "tech_manager_email", null: false
    t.index ["company_name"], name: "company_name", unique: true
  end

  create_table "Elevators", primary_key: "elevator_ID", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "column_ID", null: false
    t.string "serial_number", limit: 30, null: false
    t.string "model", limit: 30, null: false
    t.string "elevator_type", limit: 50, null: false
    t.string "status", null: false
    t.date "date_commision", null: false
    t.date "date_last_inspect", null: false
    t.binary "certificate_inspect", null: false
    t.text "info", null: false
    t.text "notes", null: false
    t.index ["column_ID"], name: "Elevators_fk0"
    t.index ["serial_number"], name: "serial_number", unique: true
  end

  create_table "Employee", primary_key: "employee_ID", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_ID", null: false
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "title", null: false
    t.string "email", null: false
    t.string "password", null: false
    t.index ["user_ID"], name: "Employee_fk0"
  end

  create_table "Leads", primary_key: "lead_ID", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "full_name", null: false
    t.string "company_name", limit: 20, null: false
    t.string "email", null: false
    t.string "phone", limit: 10, null: false
    t.string "project_name", limit: 15, null: false
    t.string "department", limit: 10, null: false
    t.text "message", null: false
    t.binary "attached_file", null: false
    t.date "date_of_contact", null: false
  end

  create_table "Quotes", primary_key: "quote_ID", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "type", null: false
    t.string "product_grade", null: false
    t.integer "nb_apartments", null: false
    t.integer "nb_businesses", null: false
    t.integer "nb_companies", null: false
    t.integer "nb_floors", null: false
    t.integer "nb_basements", null: false
    t.integer "nb_cages", null: false
    t.integer "nb_parkings", null: false
    t.integer "nb_occupantsPerFloor", null: false
    t.integer "nb_operatingHours", null: false
    t.integer "nb_elevSuggested", null: false
    t.decimal "pricePerElev", precision: 10, null: false
    t.decimal "subtotal", precision: 10, null: false
    t.decimal "installFee", precision: 10, null: false
    t.decimal "finalPrice", precision: 10, null: false
  end

  create_table "Users", primary_key: "user_ID", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", null: false
    t.string "password", null: false
    t.integer "employee_ID"
    t.integer "customer_ID"
    t.index ["customer_ID"], name: "Users_fk1"
    t.index ["email"], name: "email", unique: true
    t.index ["employee_ID"], name: "Users_fk0"
  end

  create_table "active_admin_comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "employees", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "last_name", default: "", null: false
    t.string "first_name", default: "", null: false
    t.string "title"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_employees_on_email", unique: true
    t.index ["reset_password_token"], name: "index_employees_on_reset_password_token", unique: true
  end

  create_table "leads", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "full_name", null: false
    t.string "company_name"
    t.string "email", null: false
    t.string "phone"
    t.string "project_name"
    t.string "project_desc"
    t.string "department", null: false
    t.string "message", null: false
    t.binary "attached_file"
    t.timestamp "timestamp", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "quotes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "Full_Name"
    t.integer "Phone_Number"
    t.string "Company_Name"
    t.string "Email"
    t.string "Building_Type"
    t.string "Product_Grade"
    t.integer "Nb_Appartement"
    t.integer "Nb_Business"
    t.integer "Nb_Company"
    t.integer "Nb_Floor"
    t.integer "Nb_Basement"
    t.integer "Nb_Cage"
    t.integer "Nb_Parking"
    t.integer "Nb_OccupantPerFloor"
    t.string "Nb_OperatingHour"
    t.string "Nb_Ele_Suggested"
    t.string "Price_Per_Ele"
    t.string "Subtotal"
    t.string "Install_Fee"
    t.string "Final_Price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "Batteries", "Buildings", column: "building_ID", primary_key: "building_ID", name: "Batteries_fk0"
  add_foreign_key "Batteries", "Employee", column: "employee_ID", primary_key: "employee_ID", name: "Batteries_fk1"
  add_foreign_key "BuildingDetails", "Buildings", column: "building_ID", primary_key: "building_ID", name: "BuildingDetails_fk0"
  add_foreign_key "Buildings", "Address", column: "address_ID", primary_key: "address_ID", name: "Buildings_fk0"
  add_foreign_key "Buildings", "Customers", column: "customer_ID", primary_key: "customer_ID", name: "Buildings_fk1"
  add_foreign_key "Elevators", "Columns", column: "column_ID", primary_key: "column_ID", name: "Elevators_fk0"
  add_foreign_key "Employee", "Users", column: "user_ID", primary_key: "user_ID", name: "Employee_fk0"
  add_foreign_key "Users", "Customers", column: "customer_ID", primary_key: "customer_ID", name: "Users_fk1"
  add_foreign_key "Users", "Employee", column: "employee_ID", primary_key: "employee_ID", name: "Users_fk0"
end
