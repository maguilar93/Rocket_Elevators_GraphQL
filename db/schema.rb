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

ActiveRecord::Schema.define(version: 2020_03_04_213033) do

  



  create_table "quotes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "Full_Name"
    t.integer "Phone_Number"
    t.string "Company_Name"
    t.string "Email"
    t.string "Building_Type"
    t.string "Product_Grade"
    t.integer "Nb_Appartement"
    t.integer "Nb_Business"
    t.integer "Nb_Floor"
    t.integer "Nb_Basement"
    t.integer "Nb_Cage"
    t.integer "Nb_Parking"
    t.integer "Nb_OccupantPerFloor"
    t.integer "Nb_OpperatingHour"
    t.string "Final_Price"
   
  end

 

end
