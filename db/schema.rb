# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_09_13_112812) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "leads", force: :cascade do |t|
    t.string "full_name"
    t.string "email"
    t.string "phone"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "registration_number"
    t.integer "model_id"
    t.integer "year_of_manufacture"
    t.decimal "asking_price"
    t.integer "mileage"
    t.string "location"
    t.integer "listing_id"
    t.boolean "requested_financing"
    t.string "lead_source"
    t.boolean "consent", default: false, null: false
    t.boolean "sent_to_freshsales"
    t.boolean "sent_to_django_api"
  end
end
