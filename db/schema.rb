# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_210_219_214_459) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'cars', force: :cascade do |t|
    t.string 'model'
    t.string 'color'
    t.string 'bodyStyle'
    t.string 'pricePerDay'
    t.string 'doors'
    t.string 'luggages'
    t.string 'seats'
    t.string 'emissionsClass'
    t.string 'transmission'
    t.string 'engine'
    t.string 'rentDeposit'
    t.string 'carImg'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'rents', force: :cascade do |t|
    t.string 'userName'
    t.string 'model'
    t.boolean 'status'
    t.string 'pickUpDate'
    t.string 'pickUpTime'
    t.string 'returnDate'
    t.string 'returnTime'
    t.string 'location'
    t.string 'pricePerDay'
    t.bigint 'user_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['user_id'], name: 'index_rents_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'userName'
    t.string 'email'
    t.string 'password_digest'
    t.string 'role'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  add_foreign_key 'rents', 'users'
end
