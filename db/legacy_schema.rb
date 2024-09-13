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

ActiveRecord::Schema[7.2].define(version: 2024_08_16_061400) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_trgm"
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "assessment_accidentseverity", force: :cascade do |t|
    t.string "severity", limit: 255
  end

  create_table "assessment_assessmentdeductible", force: :cascade do |t|
    t.string "code", limit: 255, null: false
    t.integer "points", null: false
    t.text "description"
    t.boolean "can_range", null: false
    t.bigint "category_id", null: false
    t.index ["category_id"], name: "assessment_assessmentdeductible_category_id_68430088"
  end

  create_table "assessment_assessmentdeductiblecategory", force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.index ["name"], name: "assessment_assessmentdeductiblecategory_name_c6b081f2_like", opclass: :varchar_pattern_ops
    t.unique_constraint ["name"], name: "assessment_assessmentdeductiblecategory_name_key"
  end

  create_table "assessment_assessmentdeductibleforinspection", force: :cascade do |t|
    t.integer "points", null: false
    t.bigint "deductible_id", null: false
    t.bigint "inspection_id", null: false
    t.timestamptz "created", null: false
    t.timestamptz "modified", null: false
    t.index ["deductible_id"], name: "assessment_assessmentdeduc_deductible_id_145fcdf1"
    t.index ["inspection_id"], name: "assessment_assessmentdeduc_inspection_id_32935c10"
    t.unique_constraint ["inspection_id", "deductible_id"], name: "assessment_assessmentded_inspection_id_deductible_e5f41acd_uniq"
  end

  create_table "assessment_assessmentimage", force: :cascade do |t|
    t.timestamptz "created", null: false
    t.timestamptz "modified", null: false
    t.string "name", limit: 45
    t.string "image", limit: 100
    t.bigint "assessment_id", null: false
    t.string "image_type", limit: 5, null: false
    t.index ["assessment_id"], name: "assessment_assessmentimage_assessment_id_fbea5d87"
  end

  create_table "assessment_assessmentnote", force: :cascade do |t|
    t.timestamptz "created", null: false
    t.timestamptz "modified", null: false
    t.text "note"
    t.bigint "schedule_id", null: false
    t.bigint "user_id", null: false
    t.index ["schedule_id"], name: "assessment_assessmentnote_schedule_id_8ab7d41b"
    t.index ["user_id"], name: "assessment_assessmentnote_user_id_8a93c05e"
    t.unique_constraint ["schedule_id", "user_id"], name: "assessment_assessmentnote_schedule_id_user_id_7447da2b_uniq"
  end

  create_table "assessment_assessmentreport", force: :cascade do |t|
    t.timestamptz "created", null: false
    t.timestamptz "modified", null: false
    t.timestamptz "date"
    t.string "file", limit: 100
    t.string "status", limit: 5, null: false
    t.bigint "schedule_id", null: false
    t.bigint "approved_by_id"
    t.index ["approved_by_id"], name: "assessment_assessmentreport_approved_by_id_c35d185e"
    t.unique_constraint ["schedule_id"], name: "assessment_assessmentreport_schedule_id_key"
  end

  create_table "assessment_attentionlevelstatus", force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.integer "priority", null: false
    t.index ["name"], name: "assessment_attentionlevelstatus_name_24838ca7_like", opclass: :varchar_pattern_ops
    t.unique_constraint ["name"], name: "assessment_attentionlevelstatus_name_key"
    t.unique_constraint ["priority"], name: "assessment_attentionlevelstatus_priority_key"
  end

  create_table "assessment_carcare", force: :cascade do |t|
    t.timestamptz "created", null: false
    t.timestamptz "modified", null: false
    t.timestamptz "submit_date"
    t.integer "mileage"
    t.string "owner_name", limit: 45
    t.string "owner_email", limit: 254
    t.string "owner_phone", limit: 30
    t.string "status", limit: 2, null: false
    t.bigint "schedule_id", null: false
    t.text "customer_request"
    t.timestamptz "datetime_car_delivered"
    t.timestamptz "datetime_car_received"
    t.text "technician_remarks"
    t.bigint "work_request_id"
    t.index ["work_request_id"], name: "assessment_carcare_work_request_id_1d725677"
    t.unique_constraint ["schedule_id"], name: "assessment_carcare_schedule_id_key"
  end

  create_table "assessment_carcareinspectionitem", force: :cascade do |t|
    t.timestamptz "created", null: false
    t.timestamptz "modified", null: false
    t.text "comments"
    t.boolean "to_repair", null: false
    t.bigint "car_care_id", null: false
    t.bigint "item_type_id", null: false
    t.bigint "attention_level_status_id"
    t.bigint "repair_severity_level_id"
    t.index ["attention_level_status_id"], name: "assessment_carcareinspecti_attention_level_status_id_6696b276"
    t.index ["car_care_id"], name: "assessment_carcareinspectionitem_car_care_id_d6841212"
    t.index ["item_type_id"], name: "assessment_carcareinspectionitem_item_type_id_f1ecf357"
    t.index ["repair_severity_level_id"], name: "assessment_carcareinspecti_repair_severity_level_id_7da917fc"
  end

  create_table "assessment_carcareinspectionitemtype", force: :cascade do |t|
    t.timestamptz "created", null: false
    t.timestamptz "modified", null: false
    t.string "section", limit: 255
    t.string "name", limit: 255, null: false
  end

  create_table "assessment_carcareinvoice", force: :cascade do |t|
    t.timestamptz "created", null: false
    t.timestamptz "modified", null: false
    t.boolean "is_paid", null: false
    t.timestamptz "datetime_received"
    t.bigint "car_care_id", null: false
    t.integer "sub_total", null: false
    t.integer "vat_amount", null: false
    t.index ["car_care_id"], name: "assessment_carcareinvoice_car_care_id_86e10af8"
  end

  create_table "assessment_carcareinvoiceitem", force: :cascade do |t|
    t.timestamptz "created", null: false
    t.timestamptz "modified", null: false
    t.text "description"
    t.float "unit_cost"
    t.integer "quantity", null: false
    t.bigint "invoice_id", null: false
    t.string "name", limit: 255
    t.bigint "quote_item_id", null: false
    t.index ["invoice_id"], name: "assessment_carcareinvoiceitem_invoice_id_0010809e"
    t.index ["quote_item_id"], name: "assessment_carcareinvoiceitem_quote_item_id_3a3c1b04"
  end
end
