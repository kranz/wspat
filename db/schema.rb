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

ActiveRecord::Schema.define(:version => 20121130162435) do

  create_table "patients", :force => true do |t|
    t.integer  "idpaz"
    t.string   "cognome"
    t.string   "nome"
    t.string   "gruppo"
    t.string   "rh"
    t.string   "diagnosi"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "sesso"
    t.date     "datanascita"
    t.string   "livfattcar"
    t.string   "inibitore8"
    t.string   "unitab8"
    t.string   "preddavp1"
    t.string   "preddavp2"
    t.string   "preddavp3"
    t.string   "preddavp4"
    t.string   "preddavp5"
    t.string   "postddavp1"
    t.string   "postddavp2"
    t.string   "postddavp3"
    t.string   "postddavp4"
    t.string   "postddavp5"
    t.string   "accven"
    t.string   "accventipo"
    t.string   "rcof"
    t.string   "fibrinogeno"
    t.string   "concentrato"
    t.string   "fattII"
    t.string   "fattVII"
    t.string   "fattVIII"
    t.string   "fattIX"
    t.string   "fattX"
    t.string   "fattXI"
    t.string   "fattXIII"
  end

end
