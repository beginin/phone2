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

ActiveRecord::Schema.define(:version => 20130620044051) do

  create_table "calllogs", :force => true do |t|
    t.integer  "tnumber",            :limit => 8
    t.integer  "load_id"
    t.datetime "date"
    t.time     "duration"
    t.decimal  "coast",                           :precision => 15, :scale => 4
    t.integer  "tnumber_out",        :limit => 8
    t.integer  "tnumber_in",         :limit => 8
    t.integer  "typecall_id"
    t.integer  "descriptioncall_id"
    t.integer  "typeconnect_id"
    t.integer  "base"
    t.decimal  "valuemb",                         :precision => 15, :scale => 4
    t.datetime "created_at",                                                     :null => false
    t.datetime "updated_at",                                                     :null => false
  end

  create_table "cfus", :force => true do |t|
    t.string   "namecfu"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "descriptioncalls", :force => true do |t|
    t.string   "name"
    t.boolean  "fin"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "holidays", :force => true do |t|
    t.date     "date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "loadcalls", :force => true do |t|
    t.datetime "date"
    t.string   "admin"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "schedules", :force => true do |t|
    t.time     "timein"
    t.time     "timeout"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "simlogs", :force => true do |t|
    t.integer  "sim_id"
    t.integer  "user_id"
    t.datetime "datestart"
    t.datetime "datestop"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "simnumlogs", :force => true do |t|
    t.integer  "tnumber_id"
    t.integer  "sim_id"
    t.datetime "datestart"
    t.datetime "datestop"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sims", :force => true do |t|
    t.string   "sirealnumber"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "sumlimits", :force => true do |t|
    t.string   "namelimit"
    t.decimal  "money"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tarifs", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "tnumbers", :force => true do |t|
    t.integer  "voicenumber", :limit => 8
    t.integer  "sortnumber"
    t.datetime "datein"
    t.datetime "dateout"
    t.boolean  "block"
    t.integer  "tarif_id"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "typecalls", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "typeconnects", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "userlogs", :force => true do |t|
    t.integer  "user_id"
    t.integer  "cfu_id"
    t.integer  "schedule_id"
    t.integer  "sumlimit_id"
    t.datetime "datestart"
    t.datetime "datestop"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "sname"
    t.string   "fname"
    t.string   "mname"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
