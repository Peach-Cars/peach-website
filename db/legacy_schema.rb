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

ActiveRecord::Schema[7.2].define(version: 2024_09_13_100032) do
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

  create_table "assessment_carcarejobcard", id: :bigint, default: -> { "nextval('assessment_ccjobcard_id_seq'::regclass)" }, force: :cascade do |t|
    t.timestamptz "created", null: false
    t.timestamptz "modified", null: false
    t.boolean "is_submitted", null: false
    t.boolean "is_closed", null: false
    t.text "comments"
    t.bigint "car_care_id", null: false

    t.unique_constraint ["car_care_id"], name: "assessment_carcarejobcard_car_care_id_0884d3a0_uniq"
  end

  create_table "assessment_carcarejobcard_contractors", id: :serial, force: :cascade do |t|
    t.bigint "carcarejobcard_id", null: false
    t.bigint "contractor_id", null: false
    t.index ["carcarejobcard_id"], name: "assessment_carcarejobcard__carcarejobcard_id_7989d929"
    t.index ["contractor_id"], name: "assessment_carcarejobcard_contractors_contractor_id_c9d8fdfd"
    t.unique_constraint ["carcarejobcard_id", "contractor_id"], name: "assessment_carcarejobcar_carcarejobcard_id_contra_f91e014f_uniq"
  end

  create_table "assessment_carcarejobcard_technicians", id: :serial, force: :cascade do |t|
    t.bigint "carcarejobcard_id", null: false
    t.bigint "user_id", null: false
    t.index ["carcarejobcard_id"], name: "assessment_carcarejobcard__carcarejobcard_id_12071d24"
    t.index ["user_id"], name: "assessment_carcarejobcard_technicians_user_id_db0e4cda"
    t.unique_constraint ["carcarejobcard_id", "user_id"], name: "assessment_carcarejobcar_carcarejobcard_id_user_i_7f17a2d2_uniq"
  end

  create_table "assessment_carcarejobcarditem", id: :bigint, default: -> { "nextval('assessment_ccjobcarditem_id_seq'::regclass)" }, force: :cascade do |t|
    t.timestamptz "created", null: false
    t.timestamptz "modified", null: false
    t.boolean "is_done", null: false
    t.timestamptz "datetime_started"
    t.timestamptz "datetime_ended"
    t.text "technician_comments"
    t.text "customer_feedback"
    t.bigint "job_card_id", null: false
    t.boolean "is_uncompletable", null: false
    t.bigint "quote_item_id", null: false
    t.string "name", limit: 255
    t.index ["job_card_id"], name: "assessment_ccjobcarditem_job_card_id_968ac187"
    t.index ["quote_item_id"], name: "assessment_ccjobcarditem_quote_item_id_c61230c7"
  end

  create_table "assessment_carcarelead", force: :cascade do |t|
    t.timestamptz "created_date", null: false
    t.string "first_name", limit: 255
    t.string "last_name", limit: 255
    t.string "email", limit: 254
    t.string "mobile", limit: 15
    t.string "form_type", limit: 15
    t.integer "year_of_make", null: false
    t.string "how_did_you_hear", limit: 255
    t.bigint "vehicle_model_id", null: false
    t.string "status", limit: 255, null: false
    t.index ["vehicle_model_id"], name: "assessment_carcarelead_car_model_id_3179e355"
  end

  create_table "assessment_carcarelead_flags", id: :serial, force: :cascade do |t|
    t.bigint "carcarelead_id", null: false
    t.bigint "vehicleleadflags_id", null: false
    t.index ["carcarelead_id"], name: "assessment_carcarelead_flags_carcarelead_id_5bb91e07"
    t.index ["vehicleleadflags_id"], name: "assessment_carcarelead_flags_vehicleleadflags_id_09e614e8"
    t.unique_constraint ["carcarelead_id", "vehicleleadflags_id"], name: "assessment_carcarelead_f_carcarelead_id_vehiclele_dd635de2_uniq"
  end

  create_table "assessment_carcarepayment", force: :cascade do |t|
    t.timestamptz "created", null: false
    t.timestamptz "modified", null: false
    t.boolean "is_deposit", null: false
    t.integer "amount", null: false
    t.text "notes"
    t.timestamptz "datetime_received"
    t.bigint "car_care_id", null: false
    t.index ["car_care_id"], name: "assessment_carcarepayment_car_care_id_c4a6e95d"
  end

  create_table "assessment_carcarequote", id: :bigint, default: -> { "nextval('assessment_ccquote_id_seq'::regclass)" }, force: :cascade do |t|
    t.timestamptz "created", null: false
    t.timestamptz "modified", null: false
    t.boolean "is_draft", null: false
    t.boolean "is_approved_by_customer", null: false
    t.boolean "is_archived", null: false
    t.bigint "car_care_id", null: false
    t.bigint "previous_quote_id"
    t.timestamptz "date_received"
    t.text "description"
    t.integer "sub_total", null: false
    t.integer "vat_amount", null: false
    t.index ["car_care_id"], name: "assessment_ccquote_car_care_id_e99b1401"
    t.index ["previous_quote_id"], name: "assessment_ccquote_previous_quote_id_a71470bf"
  end

  create_table "assessment_carcarequoteitem", id: :bigint, default: -> { "nextval('assessment_ccquoteitem_id_seq'::regclass)" }, force: :cascade do |t|
    t.timestamptz "created", null: false
    t.timestamptz "modified", null: false
    t.text "description"
    t.float "unit_cost", null: false
    t.integer "quantity", null: false
    t.bigint "quote_id", null: false
    t.bigint "repair_id"
    t.string "name", limit: 255
    t.index ["quote_id"], name: "assessment_ccquoteitem_quote_id_16e7f78f"
    t.index ["repair_id"], name: "assessment_ccquoteitem_repair_id_2a5abf2e"
  end

  create_table "assessment_carcarerepair", force: :cascade do |t|
    t.timestamptz "created", null: false
    t.timestamptz "modified", null: false
    t.string "obd_code", limit: 45
    t.text "explanation"
    t.string "urgency", limit: 3
    t.float "estimated_cost"
    t.float "estimated_min_cost"
    t.float "estimated_max_cost"
    t.string "slug", limit: 45
    t.bigint "car_care_id", null: false
    t.bigint "inspection_item_id"
    t.bigint "walk_around_check_item_id"
    t.bigint "repair_severity_level_id"
    t.bigint "repair_type_id"
    t.string "repair_classification", limit: 50
    t.string "estimated_hours", limit: 50
    t.index ["car_care_id"], name: "assessment_carcarerepair_car_care_id_218d315c"
    t.index ["inspection_item_id"], name: "assessment_carcarerepair_inspection_item_id_7acbb4fb"
    t.index ["repair_severity_level_id"], name: "assessment_carcarerepair_repair_severity_level_id_562f0f76"
    t.index ["repair_type_id"], name: "assessment_carcarerepair_repair_type_id_fa60cc05"
    t.index ["slug"], name: "assessment_carcarerepair_slug_9da4eec6"
    t.index ["slug"], name: "assessment_carcarerepair_slug_9da4eec6_like", opclass: :varchar_pattern_ops
    t.index ["walk_around_check_item_id"], name: "assessment_carcarerepair_walk_around_check_item_id_0243c8c9"
    t.unique_constraint ["car_care_id", "inspection_item_id", "walk_around_check_item_id"], name: "assessment_carcarerepair_car_care_id_inspection_i_7e61e6c6_uniq"
  end

  create_table "assessment_carcaretyreinspection", force: :cascade do |t|
    t.string "brand", limit: 255
    t.string "side_wall_tread", limit: 255
    t.text "side_wall_comment"
    t.bigint "car_care_id", null: false
    t.bigint "tyre_position_id", null: false
    t.timestamptz "created", null: false
    t.timestamptz "modified", null: false
    t.integer "wear_percentage", null: false
    t.index ["car_care_id"], name: "assessment_carcaretyreinspection_car_care_id_084f7fc6"
    t.index ["tyre_position_id"], name: "assessment_carcaretyreinspection_tyre_position_id_1984a4b6"
  end

  create_table "assessment_carcarewalkaroundcheckitem", id: :bigint, default: -> { "nextval('assessment_walkaroundcheckitem_id_seq'::regclass)" }, force: :cascade do |t|
    t.timestamptz "created", null: false
    t.timestamptz "modified", null: false
    t.boolean "is_okay", null: false
    t.text "remarks"
    t.boolean "to_repair", null: false
    t.bigint "car_care_id", null: false
    t.bigint "walk_around_check_id", null: false
    t.bigint "repair_severity_level_id"
    t.index ["car_care_id"], name: "assessment_walkaroundcheckitem_car_care_id_8376e637"
    t.index ["repair_severity_level_id"], name: "assessment_carcarewalkarou_repair_severity_level_id_17c20fc1"
    t.index ["walk_around_check_id"], name: "assessment_walkaroundcheckitem_walk_around_check_id_b7594ff6"
  end

  create_table "assessment_carcarewalkaroundchecktype", id: :bigint, default: -> { "nextval('assessment_walkaroundchecktype_id_seq'::regclass)" }, force: :cascade do |t|
    t.timestamptz "created", null: false
    t.timestamptz "modified", null: false
    t.string "name", limit: 255, null: false
  end

  create_table "assessment_inspection", force: :cascade do |t|
    t.timestamptz "created", null: false
    t.timestamptz "modified", null: false
    t.integer "mileage"
    t.bigint "schedule_id", null: false
    t.text "comments"
    t.boolean "seller_has_tims_account"
    t.string "seller_name", limit: 60
    t.boolean "seller_name_matches_tims_account"
    t.string "seller_phone", limit: 60
    t.string "ability_of_washer", limit: 5
    t.boolean "brake_light_left"
    t.boolean "brake_light_right"
    t.text "brake_lights_comment"
    t.boolean "fog_light_left"
    t.boolean "fog_light_right"
    t.text "fog_lights_comment"
    t.string "has_windshield_front", limit: 5
    t.string "has_windshield_rear", limit: 5
    t.string "has_windshield_side", limit: 5
    t.boolean "hazard_front_left_light"
    t.boolean "hazard_front_right_light"
    t.text "hazard_lights_comment"
    t.boolean "hazard_rear_left_light"
    t.boolean "hazard_rear_right_light"
    t.text "headlights_front_comment"
    t.boolean "headlights_high_beam_front_left"
    t.boolean "headlights_high_beam_front_right"
    t.boolean "headlights_rear_left"
    t.boolean "headlights_rear_right"
    t.boolean "indicator_front_left_light"
    t.boolean "indicator_front_right_light"
    t.text "indicator_lights_comment"
    t.boolean "indicator_rear_left_light"
    t.boolean "indicator_rear_right_light"
    t.boolean "interior_light"
    t.text "interior_number_plate_light_comment"
    t.string "lock_central_switching_function", limit: 5
    t.text "ability_of_washer_comment"
    t.string "lock_key_function", limit: 5
    t.boolean "number_plate_light"
    t.boolean "parking_front_left_light"
    t.boolean "parking_front_right_light"
    t.text "parking_lights_comment"
    t.boolean "parking_rear_left_light"
    t.boolean "parking_rear_right_light"
    t.string "power_mirror_right_adjustment_of_angles", limit: 5
    t.text "has_windshield_front_comment"
    t.string "power_mirror_right_opening_closing", limit: 5
    t.string "seats_type_ability", limit: 5
    t.text "has_windshield_rear_comment"
    t.boolean "reverse_left_light"
    t.text "reverse_lights_comment"
    t.boolean "reverse_right_light"
    t.text "has_windshield_side_comment"
    t.string "seat_belt_functionality", limit: 5
    t.string "seat_belt_warning_light", limit: 5
    t.string "windscreen_after_using_wiper", limit: 5
    t.text "lock_central_switching_function_comment"
    t.text "lock_key_function_comment"
    t.text "interior_exterior_comment"
    t.string "has_cigarette_smell", limit: 3
    t.string "has_pet_hair", limit: 3
    t.string "overall_condition", limit: 3
    t.string "tyre_front_left_brand", limit: 45
    t.integer "tyre_front_left_wear"
    t.string "tyre_front_right_brand", limit: 45
    t.integer "tyre_front_right_wear"
    t.string "tyre_rear_left_brand", limit: 45
    t.integer "tyre_rear_left_wear"
    t.string "tyre_rear_right_brand", limit: 45
    t.integer "tyre_rear_right_wear"
    t.text "tyre_side_wall_treads_comment"
    t.string "tyre_side_wall_treads_status", limit: 5
    t.text "ac_comment"
    t.integer "ac_function"
    t.text "acceleration_excess_smoke_comment"
    t.integer "acceleration_excess_smoke"
    t.integer "acceleration_hesitation"
    t.integer "acceleration_judder"
    t.integer "alternator_through_battery_test"
    t.integer "brake_system_disk_check"
    t.integer "battery_exterior_wiring"
    t.string "body_work", limit: 3
    t.integer "brake_booster_master_cylinder"
    t.integer "brake_system_pad_check"
    t.integer "brake_fluid_leaks"
    t.integer "brake_hose_condition"
    t.integer "brake_pedal_height_free_play"
    t.text "acceleration_hesitation_comment"
    t.integer "brake_pipe_condition"
    t.text "acceleration_judder_comment"
    t.text "alternator_through_battery_test_comment"
    t.integer "braking_stability"
    t.integer "cooling_system_leaks_coolant"
    t.integer "power_flow_at_cvt_status"
    t.integer "engine_fuel_leaks"
    t.integer "engine_oil_leaks"
    t.integer "power_flow_crank_shaft_seal_leaks"
    t.integer "power_flow_differential_gear"
    t.integer "fan_belt_condition"
    t.text "brake_system_disk_check_comment"
    t.integer "four_wd_diff_lock_functionality"
    t.integer "four_wd_part_time_functionality"
    t.integer "four_wd_turn_around_noise"
    t.string "frame_damage", limit: 3
    t.text "frame_damage_comment"
    t.text "battery_exterior_wiring_comment"
    t.integer "idling_engine_noise"
    t.integer "idling_gear_vibration"
    t.integer "idling_shift_lever_function"
    t.integer "idling_start_function"
    t.text "brake_booster_master_cylinder_comment"
    t.integer "lighting_function_on_off"
    t.integer "lighting_lens"
    t.integer "low_speed_clutch_condition"
    t.text "brake_system_pad_check_comment"
    t.integer "low_speed_stability"
    t.integer "low_speed_turning_steering_function"
    t.integer "low_speed_turning_steering_noise"
    t.text "brake_fluid_leaks_comment"
    t.integer "medium_high_speed_noise"
    t.integer "medium_high_speed_stability"
    t.integer "medium_high_speed_transimission_function"
    t.integer "medium_high_speed_vibration"
    t.integer "meter_cluster"
    t.text "meter_cluster_comment"
    t.text "brake_hose_condition_comment"
    t.integer "no_load_hesitation_flat_stop"
    t.integer "no_load_turbo_noise"
    t.integer "no_load_white_smoke"
    t.text "body_work_comment"
    t.string "paint_work", limit: 3
    t.integer "parking_brake"
    t.integer "radiator_hose_cap"
    t.string "repainted", limit: 3
    t.text "brake_pedal_height_free_play_comment"
    t.integer "steering_excess_play"
    t.integer "steering_function"
    t.integer "steering_noise"
    t.integer "suspension_boots"
    t.integer "power_flow_exhaust_pipe_silencer"
    t.integer "suspension_lower_upper_arm"
    t.integer "suspension_shocks"
    t.integer "suspension_springs"
    t.integer "power_flow_gear_box_oil_pan_leaks"
    t.integer "power_flow_hub_wheel_bearings"
    t.integer "steering_box_rack"
    t.text "brake_pipe_condition_comment"
    t.text "braking_stability_comment"
    t.string "obd_accessories_errors", limit: 3
    t.string "obd_brake_errors", limit: 3
    t.string "obd_check_done", limit: 3
    t.text "obd_comment"
    t.string "obd_engine_errors", limit: 3
    t.string "obd_gearbox_pwr_train_errors", limit: 3
    t.string "obd_suspension_steering_errors", limit: 3
    t.string "other_repairs_needed", limit: 3
    t.text "power_mirror_right_adjustment_of_angles_comment"
    t.text "power_mirror_right_opening_closing_comment"
    t.text "seat_belt_functionality_comment"
    t.text "seat_belt_warning_light_comment"
    t.text "windscreen_after_using_wiper_comment"
    t.text "cooling_system_leaks_coolant_comment"
    t.text "engine_device_check_done_comment"
    t.text "engine_fuel_leaks_comment"
    t.text "engine_oil_leaks_comment"
    t.text "power_flow_at_cvt_status_comment"
    t.text "power_flow_crank_shaft_seal_leaks_comment"
    t.text "fan_belt_condition_comment"
    t.text "four_wd_diff_lock_functionality_comment"
    t.text "four_wd_part_time_functionality_comment"
    t.text "four_wd_turn_around_noise_comment"
    t.text "idling_engine_noise_comment"
    t.text "idling_gear_vibration_comment"
    t.text "idling_shift_lever_function_comment"
    t.text "idling_start_function_comment"
    t.text "lighting_function_on_off_comment"
    t.text "lighting_lens_comment"
    t.text "low_speed_clutch_condition_comment"
    t.text "low_speed_stability_comment"
    t.text "low_speed_turning_steering_function_comment"
    t.text "low_speed_turning_steering_noise_comment"
    t.text "medium_high_speed_noise_comment"
    t.text "medium_high_speed_stability_comment"
    t.text "medium_high_speed_transimission_function_comment"
    t.text "medium_high_speed_vibration_comment"
    t.text "no_load_hesitation_flat_stop_comment"
    t.text "no_load_turbo_noise_comment"
    t.text "no_load_white_smoke_comment"
    t.text "paint_work_comment"
    t.text "parking_brake_comment"
    t.text "radiator_hose_cap_comment"
    t.text "steering_excess_play_comment"
    t.text "steering_function_comment"
    t.text "steering_noise_comment"
    t.text "suspension_boots_comment"
    t.text "power_flow_differential_gear_comment"
    t.text "suspension_lower_upper_arm_comment"
    t.text "suspension_shocks_comment"
    t.text "suspension_springs_comment"
    t.text "power_flow_exhaust_pipe_silencer_comment"
    t.text "power_flow_gear_box_oil_pan_leaks_comment"
    t.text "power_flow_hub_wheel_bearings_comment"
    t.string "basic_info_status", limit: 2, null: false
    t.string "feature_functionality_status", limit: 2, null: false
    t.string "interior_exterior_status", limit: 2, null: false
    t.string "mechanical_status", limit: 2, null: false
    t.string "obd_status", limit: 2, null: false
    t.string "status", limit: 2, null: false
    t.timestamptz "submit_date"
    t.string "obd_report_file", limit: 100
    t.string "tyre_spare_brand", limit: 45
    t.integer "tyre_spare_wear"
    t.text "other"
    t.string "grade", limit: 3
    t.integer "grade_points", null: false
    t.boolean "all_lights_light_up_on_key_on", null: false
    t.text "all_lights_light_up_on_key_on_comment"
    t.integer "battery_percentage"
    t.string "battery_test", limit: 2
    t.string "engine_device_check_done", limit: 4
    t.text "steering_box_rack_comment"
    t.integer "steering_cv_joint"
    t.text "steering_cv_joint_comment"
    t.integer "steering_engine_oil_leaks"
    t.text "steering_engine_oil_leaks_comment"
    t.integer "steering_pump_leaks"
    t.text "steering_pump_leaks_comment"
    t.integer "steering_tie_rod_ball_joint"
    t.text "steering_tie_rod_ball_joint_comment"
    t.integer "suspension_rubber_mountings_links_bushes"
    t.text "suspension_rubber_mountings_links_bushes_comment"
    t.string "has_rust", limit: 3
    t.text "rust_location"
    t.integer "tyre_overall_status"
    t.text "tyre_overall_status_comment"
    t.integer "wiper_blades_status"
    t.text "wiper_blades_status_comment"
    t.integer "brake_system_lining_check"
    t.text "brake_system_lining_check_comment"
    t.integer "clutch_hose_condition"
    t.text "clutch_hose_condition_comment"
    t.integer "clutch_pedal_condition"
    t.text "clutch_pedal_condition_comment"
    t.integer "clutch_pedal_system"
    t.text "clutch_pedal_system_comment"
    t.integer "clutch_pipe_condition"
    t.text "clutch_pipe_condition_comment"
    t.integer "medium_high_speed_differrential"
    t.text "medium_high_speed_differrential_comment"
    t.integer "medium_high_speed_engine"
    t.text "medium_high_speed_engine_comment"
    t.integer "power_flow_knucle"
    t.text "power_flow_knucle_comment"
    t.integer "power_flow_propeller"
    t.text "power_flow_propeller_comment"
    t.string "seats_type", limit: 6
    t.text "seats_type_ability_comment"
    t.string "structure_damage", limit: 3
    t.text "structure_damage_comment"
    t.text "headlights_rear_comment"
    t.boolean "headlights_low_beam_front_left"
    t.boolean "headlights_low_beam_front_right"
    t.integer "brake_calipers_condition"
    t.text "brake_calipers_condition_comment"
    t.string "side_mirror_left", limit: 5
    t.text "side_mirror_left_comment"
    t.string "side_mirror_right", limit: 5
    t.text "side_mirror_right_comment"
    t.string "side_mirror_type", limit: 6
    t.string "power_mirror_left_adjustment_of_angles", limit: 5
    t.text "power_mirror_left_adjustment_of_angles_comment"
    t.string "power_mirror_left_opening_closing", limit: 5
    t.text "power_mirror_left_opening_closing_comment"
    t.string "bonnet_hinges", limit: 4
    t.text "bonnet_hinges_comment"
    t.string "bonnet_lock", limit: 4
    t.text "bonnet_lock_comment"
    t.string "bonnet_struts", limit: 4
    t.text "bonnet_struts_comment"
    t.string "boot_hinges", limit: 4
    t.text "boot_hinges_comment"
    t.string "boot_lock", limit: 4
    t.text "boot_lock_comment"
    t.string "boot_struts", limit: 4
    t.text "boot_struts_comment"
    t.string "power_mirror_left_noise", limit: 5
    t.text "power_mirror_left_noise_comment"
    t.string "power_mirror_right_noise", limit: 5
    t.text "power_mirror_right_noise_comment"
    t.string "power_mirror_left_speed", limit: 5
    t.text "power_mirror_left_speed_comment"
    t.string "power_mirror_right_speed", limit: 5
    t.text "power_mirror_right_speed_comment"
    t.string "power_window_back_left_auto_mode", limit: 5
    t.text "power_window_back_left_auto_mode_comment"
    t.string "power_window_back_left_noise", limit: 5
    t.text "power_window_back_left_noise_comment"
    t.string "power_window_back_left_speed", limit: 5
    t.text "power_window_back_left_speed_comment"
    t.string "power_window_back_right_auto_mode", limit: 5
    t.text "power_window_back_right_auto_mode_comment"
    t.string "power_window_back_right_noise", limit: 5
    t.text "power_window_back_right_noise_comment"
    t.string "power_window_back_right_speed", limit: 5
    t.text "power_window_back_right_speed_comment"
    t.string "power_window_front_left_auto_mode", limit: 5
    t.text "power_window_front_left_auto_mode_comment"
    t.string "power_window_front_left_noise", limit: 5
    t.text "power_window_front_left_noise_comment"
    t.string "power_window_front_left_speed", limit: 5
    t.text "power_window_front_left_speed_comment"
    t.string "power_window_front_right_auto_mode", limit: 5
    t.text "power_window_front_right_auto_mode_comment"
    t.string "power_window_front_right_noise", limit: 5
    t.text "power_window_front_right_noise_comment"
    t.string "power_window_front_right_speed", limit: 5
    t.text "power_window_front_right_speed_comment"
    t.string "window_type", limit: 6
    t.string "manual_window_back_left", limit: 5
    t.text "manual_window_back_left_comment"
    t.string "manual_window_back_right", limit: 5
    t.text "manual_window_back_right_comment"
    t.string "manual_window_front_left", limit: 5
    t.text "manual_window_front_left_comment"
    t.string "manual_window_front_right", limit: 5
    t.text "manual_window_front_right_comment"
    t.string "door_alignment", limit: 3
    t.text "door_alignment_comment"
    t.integer "acceleration_runaway"
    t.text "acceleration_runaway_comment"
    t.integer "torsion_bar"
    t.text "torsion_bar_comment"
    t.integer "drive_shaft_seals"
    t.text "drive_shaft_seals_comment"
    t.integer "clutch_system_condition"
    t.text "clutch_system_condition_comment"
    t.integer "supercharge_condition"
    t.text "supercharge_condition_comment"
    t.integer "engine_running_condition"
    t.text "engine_running_condition_comment"
    t.integer "battery_starting_condition"
    t.text "battery_starting_condition_comment"
    t.string "has_transfer_case", limit: 3
    t.integer "transfer_case_function"
    t.text "transfer_case_function_comment"
    t.string "exhaust_has_catalytic_converter", limit: 3
    t.string "has_matching_hydraulic_suspension", limit: 2
    t.text "has_matching_hydraulic_suspension_comment"
    t.string "suspension_system_type", limit: 2
    t.string "buyer_notes", limit: 1200
    t.string "general_observation_status", limit: 2, null: false
    t.string "has_accident", limit: 3
    t.string "has_accident_comment", limit: 1200
    t.string "other_comments_not_in_report", limit: 1200
    t.string "other_obd_comments", limit: 1200
    t.string "past_incidents_and_repairs_observation", limit: 1200

    t.unique_constraint ["schedule_id"], name: "assessment_inspection_schedule_id_key"
  end

  create_table "assessment_inspection_accident_severity", id: :serial, force: :cascade do |t|
    t.bigint "inspection_id", null: false
    t.bigint "accidentseverity_id", null: false
    t.index ["accidentseverity_id"], name: "assessment_inspection_acci_accidentseverity_id_7eab2927"
    t.index ["inspection_id"], name: "assessment_inspection_accident_severity_inspection_id_da2733c1"
    t.unique_constraint ["inspection_id", "accidentseverity_id"], name: "assessment_inspection_ac_inspection_id_accidentse_6efa9fa8_uniq"
  end

  create_table "assessment_inspectionimage", force: :cascade do |t|
    t.timestamptz "created", null: false
    t.timestamptz "modified", null: false
    t.string "name", limit: 45
    t.string "image", limit: 100
    t.string "location", limit: 2, null: false
    t.bigint "inspection_id", null: false
    t.index ["inspection_id"], name: "assessment_inspectionimage_inspection_id_a16d0655"
  end

  create_table "assessment_inspectionminage", force: :cascade do |t|
    t.integer "age", null: false

    t.unique_constraint ["age"], name: "assessment_inspectionminage_years_key"
  end

  create_table "assessment_inspectionrepairerror", force: :cascade do |t|
    t.timestamptz "created", null: false
    t.timestamptz "modified", null: false
    t.string "obd_code", limit: 45
    t.text "explanation"
    t.string "urgency", limit: 3
    t.float "estimated_cost"
    t.string "slug", limit: 45
    t.bigint "inspection_id", null: false
    t.float "estimated_max_cost"
    t.float "estimated_min_cost"
    t.bigint "repair_severity_level_id"
    t.bigint "repair_type_id"
    t.string "repair_classification", limit: 50
    t.string "estimated_hours", limit: 50
    t.index ["inspection_id"], name: "assessment_inspectionrepairerror_inspection_id_953ebe52"
    t.index ["repair_severity_level_id"], name: "assessment_inspectionrepai_repair_severity_level_id_4282a8e8"
    t.index ["repair_type_id"], name: "assessment_inspectionrepairerror_repair_type_id_bd00a96f"
    t.index ["slug"], name: "assessment_inspectionrepairerror_slug_30037b1f"
    t.index ["slug"], name: "assessment_inspectionrepairerror_slug_30037b1f_like", opclass: :varchar_pattern_ops
  end

  create_table "assessment_inspectionyeargrade", force: :cascade do |t|
    t.string "letter", limit: 2, null: false
    t.integer "max_points", null: false
    t.boolean "for_accident_use", null: false
    t.string "description", limit: 255
    t.bigint "min_age_id"
    t.index ["min_age_id"], name: "assessment_inspectionyeargrade_min_age_id_f33657b7"
  end

  create_table "assessment_preprescreening", force: :cascade do |t|
    t.timestamptz "created", null: false
    t.timestamptz "modified", null: false
    t.integer "mileage"
    t.string "mileage_verified", limit: 3
    t.string "mileage_tampered", limit: 3
    t.float "price"
    t.string "viewing_at_peach", limit: 3
    t.string "status", limit: 2, null: false
    t.bigint "schedule_id", null: false
    t.timestamptz "submit_date"

    t.unique_constraint ["schedule_id"], name: "assessment_preprescreening_schedule_id_key"
  end

  create_table "assessment_prescreening", force: :cascade do |t|
    t.timestamptz "created", null: false
    t.timestamptz "modified", null: false
    t.string "location", limit: 300
    t.integer "mileage"
    t.string "google_maps_pin", limit: 200
    t.string "pre_screening_result", limit: 3, null: false
    t.boolean "result_relayed_to_owner", null: false
    t.text "result_reasoning"
    t.bigint "schedule_id", null: false
    t.float "asking_price"
    t.string "car_location", limit: 300
    t.bigint "owner_id"
    t.string "owner_phone", limit: 30
    t.string "status", limit: 2, null: false
    t.timestamptz "submit_date"
    t.string "log_book", limit: 100
    t.string "owner_name", limit: 150
    t.string "owner_email", limit: 60
    t.index ["owner_id"], name: "assessment_prescreening_owner_id_310a1abc"
    t.unique_constraint ["schedule_id"], name: "assessment_prescreening_schedule_id_523a5491_uniq"
  end

  create_table "assessment_prescreeningimage", force: :cascade do |t|
    t.timestamptz "created", null: false
    t.timestamptz "modified", null: false
    t.string "name", limit: 45
    t.string "image", limit: 100
    t.bigint "pre_screening_id", null: false
    t.index ["pre_screening_id"], name: "assessment_prescreeningimage_pre_screening_id_7d99e41f"
  end

  create_table "assessment_prescreeningplus", force: :cascade do |t|
    t.timestamptz "created", null: false
    t.timestamptz "modified", null: false
    t.integer "mileage"
    t.string "mileage_verified", limit: 3
    t.string "mileage_tampered", limit: 3
    t.string "exterior_condition", limit: 3
    t.text "exterior_comment"
    t.string "interior_condition", limit: 3
    t.text "interior_comment"
    t.string "accident_history", limit: 3
    t.text "test_drive_comment"
    t.string "obd_done", limit: 3
    t.text "obd_comment"
    t.text "overall_comment"
    t.string "repairs_needed", limit: 3
    t.string "status", limit: 2, null: false
    t.bigint "schedule_id", null: false
    t.timestamptz "submit_date"
    t.string "obd_report_file", limit: 100

    t.unique_constraint ["schedule_id"], name: "assessment_prescreeningplus_schedule_id_key"
  end

  create_table "assessment_prescreeningplusrepairerror", id: :bigint, default: -> { "nextval('assessment_preprescreeningrepairerror_id_seq'::regclass)" }, force: :cascade do |t|
    t.timestamptz "created", null: false
    t.timestamptz "modified", null: false
    t.string "obd_code", limit: 45
    t.text "explanation"
    t.string "urgency", limit: 3
    t.float "estimated_cost"
    t.string "slug", limit: 45
    t.bigint "pre_screening_plus_id", null: false
    t.float "estimated_max_cost"
    t.float "estimated_min_cost"
    t.bigint "repair_severity_level_id"
    t.bigint "repair_type_id"
    t.string "repair_classification", limit: 50
    t.string "estimated_hours", limit: 50
    t.index ["pre_screening_plus_id"], name: "assessment_preprescreening_pre_pre_screening_id_06b5320b"
    t.index ["repair_severity_level_id"], name: "assessment_prescreeningplu_repair_severity_level_id_77b34b84"
    t.index ["repair_type_id"], name: "assessment_prescreeningplusrepairerror_repair_type_id_6d2aac82"
    t.index ["slug"], name: "assessment_preprescreeningrepairerror_slug_2cab7185"
    t.index ["slug"], name: "assessment_preprescreeningrepairerror_slug_2cab7185_like", opclass: :varchar_pattern_ops
  end

  create_table "assessment_repairseveritylevel", force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.index ["name"], name: "assessment_repairseveritylevel_name_85b3995f_like", opclass: :varchar_pattern_ops
    t.unique_constraint ["name"], name: "assessment_repairseveritylevel_name_key"
  end

  create_table "assessment_repairtype", force: :cascade do |t|
    t.string "category", limit: 45, null: false
    t.string "name", limit: 255, null: false
  end

  create_table "assessment_scheduleassessment", force: :cascade do |t|
    t.timestamptz "created", null: false
    t.timestamptz "modified", null: false
    t.timestamptz "date", null: false
    t.string "assess_type", limit: 3, null: false
    t.bigint "vehicle_id"
    t.string "contact_name", limit: 45
    t.string "contact_phone", limit: 45
    t.string "contact_email", limit: 45
    t.string "contact_type", limit: 5
    t.string "source", limit: 3, null: false
    t.string "inspection_type", limit: 20
    t.string "location", limit: 3, null: false
    t.index ["vehicle_id"], name: "assessment_scheduleassessment_vehicle_id_ee041297"
  end

  create_table "assessment_scheduleassessment_technicians", id: :serial, force: :cascade do |t|
    t.bigint "scheduleassessment_id", null: false
    t.bigint "user_id", null: false
    t.index ["scheduleassessment_id"], name: "assessment_scheduleassessm_scheduleassessment_id_74ab9c89"
    t.index ["user_id"], name: "assessment_scheduleassessment_technicians_user_id_56d66c65"
    t.unique_constraint ["scheduleassessment_id", "user_id"], name: "assessment_scheduleasses_scheduleassessment_id_us_4f77bb32_uniq"
  end

  create_table "assessment_tyre", force: :cascade do |t|
    t.string "tyre_type", limit: 10
    t.string "tyre_location", limit: 100
    t.string "thread_type", limit: 100
    t.string "tyre_wear", limit: 100
    t.string "tyre_brand", limit: 100
    t.string "rim_type", limit: 100
    t.string "rim_brand", limit: 100
    t.string "rim_condition", limit: 3
    t.text "rim_condition_comment"
    t.bigint "inspection_id", null: false
    t.string "sidewall_condition", limit: 10
    t.text "sidewall_condition_comment"
    t.index ["inspection_id"], name: "assessment_tyre_inspection_id_27d922fa"
  end

  create_table "assessment_tyrepositiononvehicle", force: :cascade do |t|
    t.string "shortform", limit: 4, null: false
    t.string "name", limit: 255, null: false
  end

  create_table "assessment_workrequesttype", force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.index ["name"], name: "assessment_workrequesttype_name_46d27363_like", opclass: :varchar_pattern_ops
    t.unique_constraint ["name"], name: "assessment_workrequesttype_name_key"
  end

  create_table "auth_group", id: :serial, force: :cascade do |t|
    t.string "name", limit: 150, null: false
    t.index ["name"], name: "auth_group_name_a6ea08ec_like", opclass: :varchar_pattern_ops
    t.unique_constraint ["name"], name: "auth_group_name_key"
  end

  create_table "auth_group_permissions", id: :serial, force: :cascade do |t|
    t.integer "group_id", null: false
    t.integer "permission_id", null: false
    t.index ["group_id"], name: "auth_group_permissions_group_id_b120cbf9"
    t.index ["permission_id"], name: "auth_group_permissions_permission_id_84c5c92e"
    t.unique_constraint ["group_id", "permission_id"], name: "auth_group_permissions_group_id_permission_id_0cd325b0_uniq"
  end

  create_table "auth_permission", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.integer "content_type_id", null: false
    t.string "codename", limit: 100, null: false
    t.index ["content_type_id"], name: "auth_permission_content_type_id_2f476e4b"
    t.unique_constraint ["content_type_id", "codename"], name: "auth_permission_content_type_id_codename_01ab375a_uniq"
  end

  create_table "authtoken_token", primary_key: "key", id: { type: :string, limit: 40 }, force: :cascade do |t|
    t.timestamptz "created", null: false
    t.bigint "user_id", null: false
    t.index ["key"], name: "authtoken_token_key_10f0b77e_like", opclass: :varchar_pattern_ops
    t.unique_constraint ["user_id"], name: "authtoken_token_user_id_key"
  end

  create_table "core_identificationdocumentsaccesslog", force: :cascade do |t|
    t.timestamptz "access_time", null: false
    t.string "access_type", limit: 10, null: false
    t.bigint "document_data_id", null: false
    t.bigint "user_id", null: false
    t.index ["document_data_id"], name: "core_identificationdocumentsaccesslog_document_data_id_4c8e46d8"
    t.index ["user_id"], name: "core_identificationdocumentsaccesslog_user_id_3ea39fbb"
  end

  create_table "core_logbookaccesslog", force: :cascade do |t|
    t.timestamptz "access_time", null: false
    t.string "access_type", limit: 10, null: false
    t.bigint "logbook_data_id", null: false
    t.bigint "user_id", null: false
    t.index ["logbook_data_id"], name: "core_logbookaccesslog_logbook_data_id_ca3bb77e"
    t.index ["user_id"], name: "core_logbookaccesslog_user_id_77167240"
  end

  create_table "core_logprescreening", force: :cascade do |t|
    t.timestamptz "date", null: false
    t.string "image", limit: 100
    t.text "user_agent", null: false
    t.bigint "inspection_id", null: false
    t.bigint "user_id"
    t.timestamptz "created", null: false
    t.index ["inspection_id"], name: "core_logprescreening_inspection_id_244eb2b8"
    t.index ["user_id"], name: "core_logprescreening_user_id_6d36d61c"
  end

  create_table "core_subscriber", force: :cascade do |t|
    t.timestamptz "created", null: false
    t.string "email", limit: 254, null: false
    t.boolean "email_verified", null: false
    t.boolean "receive_newsletter", null: false
    t.string "newsletter_type", limit: 100, null: false
    t.string "newsletter_department", limit: 100, null: false
    t.boolean "mailchimp_status", null: false
    t.text "failure_reason"
    t.string "full_name", limit: 50
    t.index ["email"], name: "core_subscriber_email_849f4829_like", opclass: :varchar_pattern_ops
    t.unique_constraint ["email"], name: "core_subscriber_email_key"
  end

  create_table "core_vehiclehit", force: :cascade do |t|
    t.string "ip_address", limit: 45, null: false
    t.text "user_agent", null: false
    t.string "vehicle_slug", limit: 100, null: false
    t.timestamptz "created_at", null: false
  end

  create_table "data_import_inspectionmechdata1", force: :cascade do |t|
    t.timestamptz "created", null: false
    t.timestamptz "modified", null: false
    t.string "date", limit: 60
    t.string "reg_no", limit: 60
    t.string "car_make", limit: 60
    t.string "car_model", limit: 60
    t.string "mileage", limit: 60
    t.string "inspector", limit: 60
    t.string "color", limit: 60
    t.string "transmission", limit: 60
    t.string "frame_type", limit: 60
    t.string "frame_damage", limit: 60
    t.text "frame_nb"
    t.string "repainted", limit: 60
    t.string "condition_paint", limit: 60
    t.string "condition_body", limit: 60
    t.string "condition_nb", limit: 60
    t.string "tyre_fr", limit: 60
    t.string "tyre_fl", limit: 60
    t.string "tyre_rr", limit: 60
    t.string "tyre_rl", limit: 60
    t.string "tyre_nb", limit: 60
    t.string "idling_starter", limit: 60
    t.string "idling_noise", limit: 60
    t.string "idling_vibration", limit: 60
    t.string "idling_shiftlever", limit: 60
    t.string "idling_nb", limit: 60
    t.string "noload_hesitate", limit: 60
    t.string "noload_turbonoise", limit: 60
    t.string "noload_whitesmk", limit: 60
    t.text "noload_nb"
    t.string "pwrsteering_excess", limit: 60
    t.string "pwrsteering_noise", limit: 60
    t.string "pwrsteering_func", limit: 60
    t.text "pwrsteering_nb"
    t.string "brake_height", limit: 60
    t.string "brake_booster", limit: 60
    t.text "brake_nb"
    t.string "meter_ops", limit: 60
    t.string "meter_pictaken", limit: 60
    t.string "meter_nb", limit: 60
    t.string "aircon", limit: 60
    t.text "aircon_nb"
    t.string "light_lens", limit: 60
    t.text "light_lens_nb"
    t.string "light_func", limit: 60
    t.text "light_func_nb"
    t.string "oil_leaks", limit: 60
    t.string "fuel_leaks", limit: 60
    t.string "fan_belt", limit: 60
    t.string "cooling_coolant", limit: 60
    t.string "radiator", limit: 60
    t.string "brkfluid_master", limit: 60
    t.string "battery_ext", limit: 60
    t.string "alternator_test", limit: 60
    t.string "under_bonnet_nb", limit: 260
  end

  create_table "data_import_inspectionmechdata2", force: :cascade do |t|
    t.timestamptz "created", null: false
    t.timestamptz "modified", null: false
    t.string "date", limit: 60
    t.string "reg_no", limit: 60
    t.string "transmission", limit: 60
    t.string "sus_boots", limit: 60
    t.text "sus_boots_nb"
    t.string "sus_shocks", limit: 60
    t.text "sus_shocks_nb"
    t.string "sus_springs", limit: 60
    t.text "sus_springs_nb"
    t.string "sus_arms", limit: 60
    t.text "sus_arms_nb"
    t.string "sus_tierod", limit: 60
    t.text "sus_tierod_nb"
    t.string "sus_cvjoint", limit: 60
    t.text "sus_cvjoint_nb"
    t.string "sus_steeringbox", limit: 60
    t.text "sus_steering_nb"
    t.string "sus_pumpleaks", limit: 60
    t.text "sus_pumpleaks_nb"
    t.string "sus_oilpanleaks", limit: 60
    t.text "sus_oilpan_nb"
    t.string "sus_crnkshft", limit: 60
    t.text "sus_crnkshft_nb"
    t.string "sus_atcvt", limit: 60
    t.text "sus_atcvt_nb"
    t.string "sus_exhaust", limit: 60
    t.text "sus_exhaust_nb"
    t.string "shaft", limit: 60
    t.string "sus_prop", limit: 60
    t.text "shaft_nb"
    t.string "bearing", limit: 60
    t.string "sus_hub", limit: 60
    t.string "wheel", limit: 60
    t.text "bearing_nb"
    t.string "gear", limit: 60
    t.string "sus_diff", limit: 60
    t.text "gear_nb"
    t.string "sus_mountings", limit: 60
    t.text "sus_mountings_nb"
    t.string "brake_disc", limit: 60
    t.string "brake_pipe", limit: 60
    t.string "brake_hose", limit: 60
    t.text "brakes_nb"
    t.string "drv_low_stability", limit: 60
    t.string "drv_low_strfunc", limit: 60
    t.string "drv_low_strnoise", limit: 60
    t.string "drv_low_clutch", limit: 60
    t.text "drv_low_nb"
    t.string "drv_4wd_func", limit: 60
    t.string "drv_4wd_noise", limit: 60
    t.string "drv_4wd_difflock", limit: 60
    t.string "drv_acc_hesitate", limit: 60
    t.string "drv_acc_judder", limit: 60
    t.string "drv_acc_smoke", limit: 60
    t.text "drv_acc_nb"
    t.string "drv_braking_stability", limit: 60
    t.string "drv_braking_parking", limit: 60
    t.text "drv_braking_nb"
    t.string "drv_spd_stability", limit: 60
    t.string "drv_spd_vibration", limit: 60
    t.string "drv_spd_noise", limit: 60
    t.string "drv_spd_transfunc", limit: 60
    t.text "drv_spd_nb"
  end

  create_table "data_import_inspectionmechdata3", force: :cascade do |t|
    t.timestamptz "created", null: false
    t.timestamptz "modified", null: false
    t.string "date", limit: 60
    t.string "reg_no", limit: 60
    t.string "car_make", limit: 60
    t.string "car_model", limit: 60
    t.string "mileage", limit: 60
    t.string "inspector", limit: 60
    t.string "odb_check", limit: 60
    t.string "err_engine", limit: 60
    t.string "err_gearbox", limit: 60
    t.string "err_brakes", limit: 60
    t.string "err_sussteer", limit: 60
    t.string "err_accessories", limit: 60
    t.string "err_other", limit: 60
    t.text "err_nb"
    t.text "immediate_repairs"
    t.text "estimated_costs"
    t.string "color", limit: 60
  end

  create_table "data_import_inspectionrepdata1", force: :cascade do |t|
    t.timestamptz "created", null: false
    t.timestamptz "modified", null: false
    t.string "date", limit: 60
    t.string "reg_no", limit: 60
    t.string "car_make", limit: 60
    t.string "car_model", limit: 60
    t.string "mileage", limit: 60
    t.string "peach_resp", limit: 60
    t.string "wshield_front", limit: 60
    t.text "wshield_front_nb"
    t.string "wshield_side", limit: 60
    t.text "wshield_side_nb"
    t.string "wshield_rear", limit: 60
    t.text "wshield_rear_nb"
    t.string "pwindow_auto", limit: 60
    t.string "pwindow_speed", limit: 60
    t.string "pwindow_noise", limit: 60
    t.text "pwindow_nb"
    t.string "pmirror_fx", limit: 60
    t.string "pmirror_angles", limit: 60
    t.string "pmirror_keyfx", limit: 60
    t.string "pmirror_cswitch", limit: 60
    t.string "pmirror_wndscrn", limit: 60
    t.string "pmirror_washer", limit: 60
    t.text "pmirror_nb"
    t.string "pseats", limit: 60
    t.string "seatbelts", limit: 60
    t.string "seatbelts_wrngs", limit: 60
    t.string "lights_hd_fr", limit: 60
    t.string "lights_hd_fl", limit: 60
    t.string "lights_hd_rr", limit: 60
    t.string "lights_hd_rl", limit: 60
    t.text "lights_hd_nb"
    t.string "lights_pk_fr", limit: 60
    t.string "lights_pk_fl", limit: 60
    t.string "lights_pk_rr", limit: 60
    t.string "lights_rv_rr", limit: 60
    t.string "lights_pk_rl", limit: 60
    t.text "lights_pk_nb"
    t.string "lights_brk_rr", limit: 60
    t.string "lights_brk_rl", limit: 60
    t.text "lights_brk_nb"
    t.string "lights_ind_fr", limit: 60
    t.string "lights_ind_rl", limit: 60
    t.text "lights_ind_nb"
    t.string "lights_hzd_fr", limit: 60
    t.string "lights_hzd_fl", limit: 60
    t.string "lights_hzd_rr", limit: 60
    t.string "lights_hzd_rl", limit: 60
    t.text "lights_hzd_nb"
    t.string "lights_fog_fr", limit: 60
    t.string "lights_fog_fl", limit: 60
    t.string "numberplate", limit: 60
    t.string "numberplate_nb", limit: 60
    t.string "emg_sparetyre", limit: 60
    t.string "emg_prepairkit", limit: 60
    t.string "emg_jack", limit: 60
    t.string "emg_lifesaver", limit: 60
    t.string "color", limit: 60
    t.string "lights_ind_fl", limit: 60
    t.string "lights_ind_rr", limit: 60
  end

  create_table "data_import_inspectionrepdata2", force: :cascade do |t|
    t.timestamptz "created", null: false
    t.timestamptz "modified", null: false
    t.string "date", limit: 60
    t.string "reg_no", limit: 60
    t.string "cigarette_smell", limit: 60
    t.string "pet_hair", limit: 60
    t.string "overall_condition", limit: 60
    t.string "interior_url", limit: 260
    t.string "tyre_fr_name", limit: 60
    t.string "tyre_fr_worn", limit: 60
    t.string "tyre_fl_name", limit: 60
    t.string "tyre_fl_worn", limit: 60
    t.string "tyre_rr_name", limit: 60
    t.string "tyre_rr_worn", limit: 60
    t.string "tyre_rl_name", limit: 60
    t.string "tyre_rl_worn", limit: 60
    t.string "tyre_spare_name", limit: 60
    t.string "tyre_spare_worn", limit: 60
    t.string "tyre_sidewall_treads", limit: 60
    t.text "location_nb"
    t.string "exterior_url", limit: 260
  end

  create_table "data_import_inspectionrepdata3", force: :cascade do |t|
    t.timestamptz "created", null: false
    t.timestamptz "modified", null: false
    t.string "date", limit: 60
    t.string "reg_no", limit: 60
    t.string "seller_tims", limit: 60
    t.string "seller_match_tims", limit: 60
    t.string "logbk_reg", limit: 60
    t.string "logbk_make", limit: 60
    t.string "logbk_chassis", limit: 60
    t.string "logbk_model", limit: 60
    t.string "logbk_engineno", limit: 60
    t.string "logbk_yom", limit: 60
    t.string "duty", limit: 60
    t.string "transmission", limit: 60
    t.string "body_type", limit: 60
    t.string "engine_cc", limit: 60
    t.string "engine_name", limit: 60
    t.string "engine_type", limit: 60
    t.string "turbo", limit: 60
    t.string "fuel_type", limit: 60
    t.string "doors", limit: 60
    t.string "seats_max", limit: 60
    t.string "wheel_drive", limit: 60
    t.string "used_status", limit: 60
    t.string "four_wd_difflock", limit: 60
    t.string "four_wd_lowgear", limit: 60
    t.string "ideal_passngrs", limit: 60
    t.string "resale_price", limit: 60
    t.string "fuel_economy", limit: 60
    t.string "acceleration", limit: 60
    t.string "torque", limit: 60
    t.string "topspeed", limit: 60
  end

  create_table "data_import_inspectionrepdata4", force: :cascade do |t|
    t.timestamptz "created", null: false
    t.timestamptz "modified", null: false
    t.string "date", limit: 60
    t.string "reg_no", limit: 60
    t.string "airbags", limit: 60
    t.string "power_steering", limit: 60
    t.string "abs", limit: 60
    t.string "push_start", limit: 60
    t.string "remote_lock", limit: 60
    t.string "cruise_control", limit: 60
    t.string "color", limit: 60
    t.string "aircon", limit: 60
    t.string "radio", limit: 60
    t.string "display", limit: 60
    t.string "audio_cd", limit: 60
    t.string "audio_dvd", limit: 60
    t.string "audio_usb", limit: 60
    t.string "audio_aux", limit: 60
    t.string "audio_bluetooth", limit: 60
    t.string "leather_seats", limit: 60
    t.string "p_windows", limit: 60
    t.string "antitheft", limit: 60
    t.string "p_mirrors", limit: 60
    t.string "cupholders", limit: 60
    t.string "windows_tint", limit: 60
    t.string "armrest", limit: 60
    t.string "height_ctrl", limit: 60
    t.string "rear_camera", limit: 60
    t.string "sunroof", limit: 60
    t.string "safari_hatch", limit: 60
    t.string "fog_lights", limit: 60
    t.string "winch", limit: 60
    t.string "bullbar", limit: 60
    t.string "roof_rails", limit: 60
    t.string "roof_rack", limit: 60
    t.string "snorkel", limit: 60
    t.string "slide_door", limit: 60
    t.string "sidesteps", limit: 60
    t.string "spoiler", limit: 60
  end

  create_table "data_import_prescreeningdata", force: :cascade do |t|
    t.timestamptz "created", null: false
    t.timestamptz "modified", null: false
    t.string "date", limit: 60
    t.string "reg_no", limit: 60
    t.string "car_make", limit: 60
    t.string "car_model", limit: 60
    t.string "mileage", limit: 60
    t.string "prescreener", limit: 60
    t.string "car_source", limit: 60
    t.string "reason", limit: 60
    t.string "year", limit: 60
    t.string "screening_result", limit: 60
    t.string "current_loc", limit: 60
    t.string "contact", limit: 60
    t.string "asking_price", limit: 60
    t.string "engine_cc", limit: 60
    t.string "color", limit: 60
    t.string "fuel_type", limit: 60
    t.string "drive", limit: 60
    t.string "sunroof", limit: 60
    t.string "seats_number", limit: 60
    t.string "leather_seats", limit: 60
    t.string "results_comm", limit: 60
    t.string "pics_uploaded", limit: 60
    t.text "results_nb"
  end

  create_table "django_admin_log", id: :serial, force: :cascade do |t|
    t.timestamptz "action_time", null: false
    t.text "object_id"
    t.string "object_repr", limit: 200, null: false
    t.integer "action_flag", limit: 2, null: false
    t.text "change_message", null: false
    t.integer "content_type_id"
    t.bigint "user_id", null: false
    t.index ["content_type_id"], name: "django_admin_log_content_type_id_c4bce8eb"
    t.index ["user_id"], name: "django_admin_log_user_id_c564eba6"
    t.check_constraint "action_flag >= 0", name: "django_admin_log_action_flag_check"
  end

  create_table "django_content_type", id: :serial, force: :cascade do |t|
    t.string "app_label", limit: 100, null: false
    t.string "model", limit: 100, null: false

    t.unique_constraint ["app_label", "model"], name: "django_content_type_app_label_model_76bd3d3b_uniq"
  end

  create_table "django_migrations", id: :serial, force: :cascade do |t|
    t.string "app", limit: 255, null: false
    t.string "name", limit: 255, null: false
    t.timestamptz "applied", null: false
  end

  create_table "django_session", primary_key: "session_key", id: { type: :string, limit: 40 }, force: :cascade do |t|
    t.text "session_data", null: false
    t.timestamptz "expire_date", null: false
    t.index ["expire_date"], name: "django_session_expire_date_a5c62663"
    t.index ["session_key"], name: "django_session_session_key_c0390e0f_like", opclass: :varchar_pattern_ops
  end

  create_table "health_check_db_testmodel", id: :serial, force: :cascade do |t|
    t.string "title", limit: 128, null: false
  end

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
    t.integer "listing_id"
    t.boolean "requested_financing"
    t.string "lead_source"
    t.boolean "consent", default: false, null: false
    t.string "location"
  end

  create_table "users_contractor", force: :cascade do |t|
    t.timestamptz "date_added"
    t.string "name", limit: 255, null: false
    t.index ["name"], name: "users_contractor_name_bb70522b_like", opclass: :varchar_pattern_ops
    t.unique_constraint ["name"], name: "users_contractor_name_bb70522b_uniq"
  end

  create_table "users_contractor_contractor_roles", id: :serial, force: :cascade do |t|
    t.bigint "contractor_id", null: false
    t.bigint "contractorrole_id", null: false
    t.index ["contractor_id"], name: "users_contractor_contractor_roles_contractor_id_8eb9e1c9"
    t.index ["contractorrole_id"], name: "users_contractor_contractor_roles_contractorrole_id_b2c5defb"
    t.unique_constraint ["contractor_id", "contractorrole_id"], name: "users_contractor_contrac_contractor_id_contractor_7a4183b9_uniq"
  end

  create_table "users_contractorrole", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "users_duplicateuser", force: :cascade do |t|
    t.string "password", limit: 128, null: false
    t.timestamptz "last_login"
    t.boolean "is_superuser", null: false
    t.string "username", limit: 150, null: false
    t.string "first_name", limit: 150, null: false
    t.string "last_name", limit: 150, null: false
    t.string "email", limit: 254, null: false
    t.boolean "is_staff", null: false
    t.boolean "is_active", null: false
    t.timestamptz "date_joined", null: false
    t.timestamptz "last_activity", null: false
    t.timestamptz "created", null: false
    t.timestamptz "modified", null: false
    t.string "kc_id", limit: 60
    t.string "phone_number", limit: 20
    t.string "whatsapp_number", limit: 20
    t.integer "how_to_help"
    t.integer "heard_about_us"
    t.string "employment_status", limit: 20, null: false
    t.string "employment_role", limit: 10, null: false
    t.integer "duplicate_to"
    t.boolean "original", null: false
    t.index ["username"], name: "users_duplicateuser_username_5733f840_like", opclass: :varchar_pattern_ops
    t.index ["whatsapp_number"], name: "users_duplicateuser_whatsapp_number_a8525a7d_like", opclass: :varchar_pattern_ops
    t.check_constraint "duplicate_to >= 0", name: "users_duplicateuser_duplicate_to_check"
    t.unique_constraint ["username"], name: "users_duplicateuser_username_key"
    t.unique_constraint ["whatsapp_number"], name: "users_duplicateuser_whatsapp_number_key"
  end

  create_table "users_duplicateuser_groups", id: :serial, force: :cascade do |t|
    t.bigint "duplicateuser_id", null: false
    t.integer "group_id", null: false
    t.index ["duplicateuser_id"], name: "users_duplicateuser_groups_duplicateuser_id_e6a8e006"
    t.index ["group_id"], name: "users_duplicateuser_groups_group_id_f2e0206b"
    t.unique_constraint ["duplicateuser_id", "group_id"], name: "users_duplicateuser_grou_duplicateuser_id_group_i_ffb123e5_uniq"
  end

  create_table "users_duplicateuser_roles", id: :serial, force: :cascade do |t|
    t.bigint "duplicateuser_id", null: false
    t.string "userrole_id", limit: 45, null: false
    t.index ["duplicateuser_id"], name: "users_duplicateuser_roles_duplicateuser_id_7c1d1b33"
    t.index ["userrole_id"], name: "users_duplicateuser_roles_userrole_id_c06720fb"
    t.index ["userrole_id"], name: "users_duplicateuser_roles_userrole_id_c06720fb_like", opclass: :varchar_pattern_ops
    t.unique_constraint ["duplicateuser_id", "userrole_id"], name: "users_duplicateuser_role_duplicateuser_id_userrol_d8b84d8e_uniq"
  end

  create_table "users_duplicateuser_user_permissions", id: :serial, force: :cascade do |t|
    t.bigint "duplicateuser_id", null: false
    t.integer "permission_id", null: false
    t.index ["duplicateuser_id"], name: "users_duplicateuser_user_permissions_duplicateuser_id_2375ed7f"
    t.index ["permission_id"], name: "users_duplicateuser_user_permissions_permission_id_58f9b9aa"
    t.unique_constraint ["duplicateuser_id", "permission_id"], name: "users_duplicateuser_user_duplicateuser_id_permiss_a2bcaea7_uniq"
  end

  create_table "users_user", force: :cascade do |t|
    t.string "password", limit: 128, null: false
    t.timestamptz "last_login"
    t.boolean "is_superuser", null: false
    t.string "username", limit: 150, null: false
    t.string "first_name", limit: 150, null: false
    t.string "last_name", limit: 150, null: false
    t.string "email", limit: 254, null: false
    t.boolean "is_staff", null: false
    t.boolean "is_active", null: false
    t.timestamptz "date_joined", null: false
    t.timestamptz "last_activity", null: false
    t.timestamptz "created", null: false
    t.timestamptz "modified", null: false
    t.string "kc_id", limit: 60
    t.string "phone_number", limit: 20
    t.string "whatsapp_number", limit: 20
    t.integer "heard_about_us"
    t.integer "how_to_help"
    t.string "employment_role", limit: 10, null: false
    t.string "employment_status", limit: 20, null: false
    t.integer "duplicate_to"
    t.boolean "original", null: false
    t.index ["username"], name: "users_user_username_06e46fe6_like", opclass: :varchar_pattern_ops
    t.index ["whatsapp_number"], name: "users_user_whatsapp_number_a486f14c_like", opclass: :varchar_pattern_ops
    t.check_constraint "duplicate_to >= 0", name: "users_user_duplicate_to_check"
    t.unique_constraint ["username"], name: "users_user_username_key"
    t.unique_constraint ["whatsapp_number"], name: "users_user_whatsapp_number_key"
  end

  create_table "users_user_groups", id: :serial, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "group_id", null: false
    t.index ["group_id"], name: "users_user_groups_group_id_9afc8d0e"
    t.index ["user_id"], name: "users_user_groups_user_id_5f6f5a90"
    t.unique_constraint ["user_id", "group_id"], name: "users_user_groups_user_id_group_id_b88eab82_uniq"
  end

  create_table "users_user_roles", id: :serial, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "userrole_id", limit: 45, null: false
    t.index ["user_id"], name: "users_user_roles_user_id_f0af70c6"
    t.index ["userrole_id"], name: "users_user_roles_userrole_id_4db5dac4"
    t.index ["userrole_id"], name: "users_user_roles_userrole_id_4db5dac4_like", opclass: :varchar_pattern_ops
    t.unique_constraint ["user_id", "userrole_id"], name: "users_user_roles_user_id_userrole_id_9ef5d132_uniq"
  end

  create_table "users_user_user_permissions", id: :serial, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "permission_id", null: false
    t.index ["permission_id"], name: "users_user_user_permissions_permission_id_0b93982e"
    t.index ["user_id"], name: "users_user_user_permissions_user_id_20aca447"
    t.unique_constraint ["user_id", "permission_id"], name: "users_user_user_permissions_user_id_permission_id_43338c45_uniq"
  end

  create_table "users_userrole", primary_key: "slug", id: { type: :string, limit: 45 }, force: :cascade do |t|
    t.string "name", limit: 45, null: false
    t.string "description", limit: 100
    t.string "kc_id", limit: 45
    t.integer "group_id"
    t.index ["name"], name: "users_userrole_name_3632e99d_like", opclass: :varchar_pattern_ops
    t.index ["slug"], name: "users_userrole_slug_7c16e4aa_like", opclass: :varchar_pattern_ops
    t.unique_constraint ["group_id"], name: "users_userrole_group_id_key"
    t.unique_constraint ["name"], name: "users_userrole_name_key"
  end

  create_table "vehicle_deletedvehiclelistingimagearchive", force: :cascade do |t|
    t.timestamptz "created", null: false
    t.timestamptz "modified", null: false
    t.string "image", limit: 100
    t.integer "order_no", null: false
    t.bigint "listing_id", null: false
    t.index ["listing_id"], name: "vehicle_deletedvehiclelistingimagearchive_listing_id_d896c582"
  end

  create_table "vehicle_duplicatevehicle", force: :cascade do |t|
    t.timestamptz "created", null: false
    t.timestamptz "modified", null: false
    t.string "name", limit: 45
    t.string "model_code", limit: 45
    t.string "color", limit: 10
    t.string "other_color", limit: 45
    t.string "registration_number", limit: 45
    t.string "registration_format", limit: 45
    t.string "year_of_manufacture", limit: 45
    t.integer "engine_cc"
    t.string "old_slug", limit: 100
    t.string "dynamic_summary_hash", limit: 255
    t.string "chasis_frame", limit: 45
    t.string "body_type", limit: 5
    t.string "transmission", limit: 3
    t.string "fuel_type", limit: 3
    t.string "engine_number", limit: 45
    t.string "used_status", limit: 4
    t.string "duty_status", limit: 4
    t.string "customer_type", limit: 4
    t.string "resell_value_status", limit: 4
    t.integer "number_of_doors"
    t.integer "maximum_number_of_seats"
    t.integer "number_of_ideal_passengers"
    t.string "drive", limit: 1
    t.boolean "has_diff_lock"
    t.boolean "has_low_gear"
    t.boolean "has_fuel_economy"
    t.boolean "has_airbags"
    t.boolean "has_power_steering"
    t.boolean "has_abs"
    t.boolean "has_push_to_start"
    t.boolean "has_remote_lock"
    t.boolean "has_cruise_control"
    t.boolean "has_turbo"
    t.boolean "has_emergency_tyre"
    t.boolean "has_life_saver"
    t.boolean "has_jack"
    t.boolean "has_fire_extinguisher"
    t.boolean "has_puncture_repair_kit"
    t.boolean "has_fm_am"
    t.boolean "has_cd"
    t.boolean "has_dvd"
    t.boolean "has_usb"
    t.boolean "has_bluetooth"
    t.boolean "has_aux"
    t.boolean "has_amplifier"
    t.boolean "has_display"
    t.boolean "has_rear_camera"
    t.boolean "has_air_conditioning"
    t.string "seats", limit: 2
    t.boolean "has_arm_rest"
    t.boolean "has_height_control"
    t.boolean "has_cup_holders"
    t.boolean "has_sunroof"
    t.boolean "has_fog_lights"
    t.boolean "has_safari_hatch"
    t.boolean "has_winch"
    t.boolean "has_bullbar"
    t.boolean "has_snorkel"
    t.boolean "has_roof_rails"
    t.boolean "has_roof_rack"
    t.boolean "has_slide_door"
    t.boolean "has_spoiler"
    t.string "current_owner_email", limit: 254
    t.string "current_owner_phone", limit: 30
    t.float "asking_price"
    t.string "current_location", limit: 300
    t.string "google_maps_pin", limit: 200
    t.integer "current_mileage"
    t.string "frame_type", limit: 2
    t.integer "seats_number"
    t.boolean "has_had_accident"
    t.string "sharable_images", limit: 20
    t.string "sourced_from", limit: 5, null: false
    t.bigint "cover_image_id"
    t.bigint "current_owner_id"
    t.bigint "model_id"
    t.boolean "registration_number_available"
    t.integer "duplicate_to"
    t.boolean "original", null: false
    t.bigint "trim_id"
    t.string "slug", limit: 100
    t.string "seller_source", limit: 20
    t.index ["cover_image_id"], name: "vehicle_duplicatevehicle_cover_image_id_6635459f"
    t.index ["current_owner_id"], name: "vehicle_duplicatevehicle_current_owner_id_38fae350"
    t.index ["model_id"], name: "vehicle_duplicatevehicle_model_id_e833da29"
    t.index ["trim_id"], name: "vehicle_duplicatevehicle_trim_id_6be75968"
    t.check_constraint "duplicate_to >= 0", name: "vehicle_duplicatevehicle_duplicate_to_check"
  end

  create_table "vehicle_duplicatevehicle_tags", id: :serial, force: :cascade do |t|
    t.bigint "duplicatevehicle_id", null: false
    t.bigint "tag_id", null: false
    t.index ["duplicatevehicle_id"], name: "vehicle_duplicatevehicle_tags_duplicatevehicle_id_6fcbd288"
    t.index ["tag_id"], name: "vehicle_duplicatevehicle_tags_tag_id_00c6dfbf"
    t.unique_constraint ["duplicatevehicle_id", "tag_id"], name: "vehicle_duplicatevehicle_duplicatevehicle_id_tag__db6b2e2c_uniq"
  end

  create_table "vehicle_duplicatevehiclelead", force: :cascade do |t|
    t.timestamptz "created", null: false
    t.timestamptz "modified", null: false
    t.string "other_model", limit: 45
    t.integer "year_of_manufacture"
    t.integer "mileage"
    t.boolean "has_had_accident"
    t.integer "asking_price"
    t.string "processing_status", limit: 5, null: false
    t.string "registration_number", limit: 45
    t.boolean "has_consented", null: false
    t.text "location"
    t.string "full_name", limit: 65
    t.string "phone", limit: 45
    t.string "email", limit: 45
    t.bigint "model_id"
    t.bigint "user_id"
    t.bigint "vehicle_id"
    t.integer "duplicate_to"
    t.boolean "original", null: false
    t.string "accident", limit: 50
    t.integer "computed_price"
    t.string "dashboard_image", limit: 100
    t.string "drive", limit: 50
    t.float "engine_cc"
    t.string "front_image", limit: 100
    t.string "fuel_type", limit: 50
    t.string "interior_image", limit: 100
    t.string "leather_seat", limit: 50
    t.integer "precision"
    t.integer "predicted_price"
    t.string "rear_image", limit: 100
    t.integer "revised_asking_price"
    t.string "seat_number", limit: 50
    t.integer "selling_price"
    t.string "side_image", limit: 100
    t.string "sunroof", limit: 50
    t.string "under_bonnet_image", limit: 100
    t.text "feedback_comment"
    t.integer "feedback_score"
    t.boolean "has_referral", null: false
    t.index ["model_id"], name: "vehicle_duplicatevehiclelead_model_id_9035ebbd"
    t.index ["user_id"], name: "vehicle_duplicatevehiclelead_user_id_5d72b0fa"
    t.check_constraint "duplicate_to >= 0", name: "vehicle_duplicatevehiclelead_duplicate_to_check"
    t.unique_constraint ["vehicle_id"], name: "vehicle_duplicatevehiclelead_vehicle_id_key"
  end

  create_table "vehicle_duplicatevehiclelead_flags", id: :serial, force: :cascade do |t|
    t.bigint "duplicatevehiclelead_id", null: false
    t.bigint "vehicleleadflags_id", null: false
    t.index ["duplicatevehiclelead_id"], name: "vehicle_duplicatevehiclele_duplicatevehiclelead_id_aec0a3f9"
    t.index ["vehicleleadflags_id"], name: "vehicle_duplicatevehiclelead_flags_vehicleleadflags_id_0842c6b5"
    t.unique_constraint ["duplicatevehiclelead_id", "vehicleleadflags_id"], name: "vehicle_duplicatevehicle_duplicatevehiclelead_id__51d575bc_uniq"
  end

  create_table "vehicle_make", force: :cascade do |t|
    t.timestamptz "created", null: false
    t.timestamptz "modified", null: false
    t.string "name", limit: 45, null: false
    t.text "description"
    t.string "slug", limit: 50, null: false
    t.boolean "is_active", null: false
    t.string "logo", limit: 100
    t.index ["slug"], name: "vehicle_make_slug_34e3a706_like", opclass: :varchar_pattern_ops
    t.unique_constraint ["slug"], name: "vehicle_make_slug_key"
  end

  create_table "vehicle_model", force: :cascade do |t|
    t.timestamptz "created", null: false
    t.timestamptz "modified", null: false
    t.string "name", limit: 45, null: false
    t.text "description"
    t.string "slug", limit: 50, null: false
    t.boolean "is_active", null: false
    t.bigint "make_id", null: false
    t.string "logo", limit: 100
    t.index ["make_id"], name: "vehicle_model_make_id_8b3ca66c"
    t.index ["slug"], name: "vehicle_model_slug_3e520e41_like", opclass: :varchar_pattern_ops
    t.unique_constraint ["name", "make_id"], name: "vehicle_model_name_make_id_ef3d4ea6_uniq"
    t.unique_constraint ["slug"], name: "vehicle_model_slug_key"
  end

  create_table "vehicle_modelcode", force: :cascade do |t|
    t.timestamptz "created", null: false
    t.timestamptz "modified", null: false
    t.string "name", limit: 45, null: false
    t.text "description"
    t.string "slug", limit: 50, null: false
    t.boolean "is_active", null: false
    t.bigint "model_id", null: false
    t.string "logo", limit: 100
    t.index ["model_id"], name: "vehicle_modelcode_model_id_52f58c98"
    t.index ["slug"], name: "vehicle_modelcode_slug_ff7ff910_like", opclass: :varchar_pattern_ops
    t.unique_constraint ["slug"], name: "vehicle_modelcode_slug_key"
  end

  create_table "vehicle_offer", force: :cascade do |t|
    t.timestamptz "created", null: false
    t.timestamptz "modified", null: false
    t.decimal "offer_amount", precision: 10, scale: 2, null: false
    t.string "origin", limit: 50, null: false
    t.text "notes"
    t.bigint "agent_id", null: false
    t.bigint "lead_id", null: false
    t.index ["agent_id"], name: "vehicle_offer_agent_id_574d247f"
    t.index ["lead_id"], name: "vehicle_offer_lead_id_3f2fd781"
    t.unique_constraint ["lead_id", "offer_amount"], name: "vehicle_offer_lead_id_offer_amount_f2bbdb6f_uniq"
  end

  create_table "vehicle_referral", force: :cascade do |t|
    t.timestamptz "created", null: false
    t.timestamptz "modified", null: false
    t.string "referrer_full_name", limit: 55, null: false
    t.string "referrer_phone_number", limit: 55, null: false
    t.string "processing_status", limit: 1, null: false
    t.bigint "buyer_lead_id"
    t.bigint "vehicle_lead_id"
    t.string "lead_type", limit: 2, null: false
    t.index ["buyer_lead_id"], name: "vehicle_referral_buyer_lead_id_f241ffdf"
    t.index ["vehicle_lead_id"], name: "vehicle_referral_vehicle_lead_id_47bccfa9"
  end

  create_table "vehicle_series", force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.bigint "model_id"
    t.index ["model_id"], name: "vehicle_series_model_id_7c85df86"
    t.unique_constraint ["name", "model_id"], name: "vehicle_series_name_model_id_4644f5ff_uniq"
  end

  create_table "vehicle_showroomvisit", force: :cascade do |t|
    t.text "notes"
    t.bigint "lead_id", null: false
    t.bigint "seller_agent_id", null: false
    t.timestamptz "created", null: false
    t.timestamptz "modified", null: false
    t.index ["lead_id"], name: "vehicle_showroomvisit_lead_id_db3c9d39"
    t.index ["seller_agent_id"], name: "vehicle_showroomvisit_seller_agent_id_6f3262d3"
  end

  create_table "vehicle_tag", force: :cascade do |t|
    t.timestamptz "created", null: false
    t.timestamptz "modified", null: false
    t.string "name", limit: 45, null: false
    t.text "description", null: false
    t.index ["name"], name: "vehicle_tag_name_bcb70239_like", opclass: :varchar_pattern_ops
    t.unique_constraint ["name"], name: "vehicle_tag_name_key"
  end

  create_table "vehicle_temporaryvehiclemodel", force: :cascade do |t|
    t.string "vehicle_id", limit: 20, null: false
    t.string "model_name", limit: 100, null: false
    t.string "make_name", limit: 100
    t.string "slug", limit: 100
    t.index ["slug"], name: "vehicle_temporaryvehiclemodel_slug_d7941282"
    t.index ["slug"], name: "vehicle_temporaryvehiclemodel_slug_d7941282_like", opclass: :varchar_pattern_ops
  end

  create_table "vehicle_temporaryvehicleregistrationnumber", force: :cascade do |t|
    t.string "vehicle_id", limit: 150, null: false
    t.string "reg_number", limit: 20, null: false
    t.string "slug", limit: 150, null: false
    t.index ["slug"], name: "vehicle_temporaryvehicleregistrationnumber_slug_435ea674_like", opclass: :varchar_pattern_ops
    t.index ["vehicle_id"], name: "vehicle_temporaryvehicle_vehicle_id_23d3e40c_like", opclass: :varchar_pattern_ops
    t.unique_constraint ["slug"], name: "vehicle_temporaryvehicleregistrationnumber_slug_key"
    t.unique_constraint ["vehicle_id"], name: "vehicle_temporaryvehicleregistrationnumber_vehicle_id_key"
  end

  create_table "vehicle_trim", force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.bigint "model_id"
    t.bigint "series_id"
    t.boolean "is_base", null: false
    t.index ["model_id"], name: "vehicle_trim_model_id_2815cc64"
    t.index ["series_id"], name: "vehicle_trim_series_id_a972dc3e"
    t.unique_constraint ["name", "model_id"], name: "vehicle_trim_name_model_id_d7022bf1_uniq"
    t.unique_constraint ["name", "series_id"], name: "vehicle_trim_name_series_id_a13ae91a_uniq"
  end

  create_table "vehicle_vehicle", force: :cascade do |t|
    t.timestamptz "created", null: false
    t.timestamptz "modified", null: false
    t.string "name", limit: 45
    t.string "color", limit: 10
    t.string "registration_number", limit: 45
    t.string "registration_format", limit: 45
    t.string "year_of_manufacture", limit: 45
    t.bigint "current_owner_id"
    t.float "asking_price"
    t.string "current_location", limit: 300
    t.integer "current_mileage"
    t.string "current_owner_phone", limit: 30
    t.string "drive", limit: 1
    t.integer "engine_cc"
    t.string "fuel_type", limit: 3
    t.string "google_maps_pin", limit: 200
    t.boolean "has_had_accident"
    t.boolean "has_sunroof"
    t.integer "seats_number"
    t.string "body_type", limit: 5
    t.string "chasis_frame", limit: 45
    t.string "duty_status", limit: 4
    t.string "engine_number", limit: 45
    t.boolean "has_abs"
    t.boolean "has_airbags"
    t.boolean "has_cruise_control"
    t.boolean "has_diff_lock"
    t.boolean "has_emergency_tyre"
    t.boolean "has_fire_extinguisher"
    t.boolean "has_fuel_economy"
    t.boolean "has_jack"
    t.boolean "has_life_saver"
    t.boolean "has_low_gear"
    t.boolean "has_power_steering"
    t.boolean "has_puncture_repair_kit"
    t.boolean "has_push_to_start"
    t.boolean "has_remote_lock"
    t.integer "maximum_number_of_seats"
    t.integer "number_of_doors"
    t.integer "number_of_ideal_passengers"
    t.string "resell_value_status", limit: 4
    t.string "transmission", limit: 3
    t.string "used_status", limit: 4
    t.boolean "has_air_conditioning"
    t.boolean "has_amplifier"
    t.boolean "has_arm_rest"
    t.boolean "has_aux"
    t.boolean "has_bluetooth"
    t.boolean "has_bullbar"
    t.boolean "has_cd"
    t.boolean "has_cup_holders"
    t.boolean "has_display"
    t.boolean "has_dvd"
    t.boolean "has_fm_am"
    t.boolean "has_fog_lights"
    t.boolean "has_height_control"
    t.boolean "has_rear_camera"
    t.boolean "has_roof_rack"
    t.boolean "has_roof_rails"
    t.boolean "has_safari_hatch"
    t.boolean "has_slide_door"
    t.boolean "has_snorkel"
    t.boolean "has_spoiler"
    t.boolean "has_usb"
    t.boolean "has_winch"
    t.string "frame_type", limit: 2
    t.bigint "model_id"
    t.string "model_code", limit: 45
    t.string "current_owner_email", limit: 254
    t.string "other_color", limit: 45
    t.string "seats", limit: 2
    t.bigint "cover_image_id"
    t.boolean "has_turbo"
    t.string "old_slug", limit: 100
    t.string "dynamic_summary_hash", limit: 255
    t.string "sharable_images", limit: 20
    t.string "customer_type", limit: 4
    t.string "sourced_from", limit: 5, null: false
    t.boolean "registration_number_available"
    t.integer "duplicate_to"
    t.boolean "original", null: false
    t.bigint "trim_id"
    t.string "slug", limit: 100
    t.string "seller_source", limit: 20
    t.index ["cover_image_id"], name: "vehicle_vehicle_cover_image_id_a6e0f274"
    t.index ["current_owner_id"], name: "vehicle_vehicle_current_owner_id_80ccfcfb"
    t.index ["model_id"], name: "vehicle_vehicle_model_id_7f174222"
    t.index ["trim_id"], name: "vehicle_vehicle_trim_id_c3732b97"
    t.check_constraint "duplicate_to >= 0", name: "vehicle_vehicle_duplicate_to_check"
  end

  create_table "vehicle_vehicle_tags", id: :serial, force: :cascade do |t|
    t.bigint "vehicle_id", null: false
    t.bigint "tag_id", null: false
    t.index ["tag_id"], name: "vehicle_vehicle_tags_tag_id_ac778624"
    t.index ["vehicle_id"], name: "vehicle_vehicle_tags_vehicle_id_57224fba"
    t.unique_constraint ["vehicle_id", "tag_id"], name: "vehicle_vehicle_tags_vehicle_id_tag_id_e6e233e5_uniq"
  end

  create_table "vehicle_vehiclebuyerlead", force: :cascade do |t|
    t.timestamptz "created", null: false
    t.timestamptz "modified", null: false
    t.string "phone", limit: 15, null: false
    t.string "full_name", limit: 255, null: false
    t.string "email", limit: 254
    t.date "date_of_viewing"
    t.string "processing_status", limit: 1, null: false
    t.bigint "vehicle_listing_id"
    t.string "viewed_price", limit: 50, null: false
    t.string "lead_source", limit: 20
    t.boolean "visited_showroom", null: false
    t.boolean "requested_financing", null: false
    t.boolean "has_referral", null: false
    t.index ["vehicle_listing_id"], name: "vehicle_vehiclebuyerlead_vehicle_listing_id_3020f12c"
    t.unique_constraint ["phone", "vehicle_listing_id"], name: "vehicle_vehiclebuyerlead_phone_vehicle_listing_id_1f66ad5f_uniq"
  end

  create_table "vehicle_vehiclebuyerlead_flags", id: :serial, force: :cascade do |t|
    t.bigint "vehiclebuyerlead_id", null: false
    t.bigint "vehicleleadflags_id", null: false
    t.index ["vehiclebuyerlead_id"], name: "vehicle_vehiclebuyerlead_flags_vehiclebuyerlead_id_71acce96"
    t.index ["vehicleleadflags_id"], name: "vehicle_vehiclebuyerlead_flags_vehicleleadflags_id_1eb2d92c"
    t.unique_constraint ["vehiclebuyerlead_id", "vehicleleadflags_id"], name: "vehicle_vehiclebuyerlead_vehiclebuyerlead_id_vehi_c996c228_uniq"
  end

  create_table "vehicle_vehiclecontactinfo", force: :cascade do |t|
    t.timestamptz "created", null: false
    t.timestamptz "modified", null: false
    t.string "contact_name", limit: 45
    t.string "contact_phone", limit: 45
    t.string "contact_email", limit: 45
    t.string "contact_type", limit: 5
    t.string "info_id", limit: 45
    t.string "purpose", limit: 45
    t.bigint "vehicle_id", null: false
    t.index ["info_id"], name: "vehicle_vehiclecontactinfo_info_id_cf8c5a1c"
    t.index ["info_id"], name: "vehicle_vehiclecontactinfo_info_id_cf8c5a1c_like", opclass: :varchar_pattern_ops
    t.index ["vehicle_id"], name: "vehicle_vehiclecontactinfo_vehicle_id_efabe1f1"
  end

  create_table "vehicle_vehiclegallery", force: :cascade do |t|
    t.timestamptz "created", null: false
    t.timestamptz "modified", null: false
    t.string "name", limit: 45
    t.text "description"
    t.bigint "vehicle_id"
    t.bigint "uploaded_by_id"
    t.bigint "vehicle_lead_id"
    t.string "type", limit: 2, null: false
    t.index ["uploaded_by_id"], name: "vehicle_vehiclegallery_uploaded_by_id_f45d2e59"
    t.index ["vehicle_id"], name: "vehicle_vehiclegallery_vehicle_id_9d298557"
    t.index ["vehicle_lead_id"], name: "vehicle_vehiclegallery_vehicle_lead_id_4467ab30"
  end

  create_table "vehicle_vehicleimage", force: :cascade do |t|
    t.timestamptz "created", null: false
    t.timestamptz "modified", null: false
    t.string "image", limit: 100
    t.string "name", limit: 45
    t.text "description"
    t.bigint "gallery_id", null: false
    t.index ["gallery_id"], name: "vehicle_vehicleimage_gallery_id_784f5b69"
  end

  create_table "vehicle_vehiclelead", force: :cascade do |t|
    t.timestamptz "created", null: false
    t.timestamptz "modified", null: false
    t.string "other_model", limit: 45
    t.integer "year_of_manufacture"
    t.integer "mileage"
    t.boolean "has_had_accident"
    t.integer "asking_price"
    t.string "full_name", limit: 65
    t.string "phone", limit: 45
    t.string "email", limit: 45
    t.bigint "model_id"
    t.bigint "vehicle_id"
    t.string "registration_number", limit: 45
    t.string "processing_status", limit: 5, null: false
    t.boolean "has_consented", null: false
    t.text "location"
    t.bigint "user_id"
    t.integer "duplicate_to"
    t.boolean "original", null: false
    t.string "accident", limit: 50
    t.integer "computed_price"
    t.string "dashboard_image", limit: 100
    t.string "drive", limit: 50
    t.float "engine_cc"
    t.string "front_image", limit: 100
    t.string "fuel_type", limit: 50
    t.string "interior_image", limit: 100
    t.string "leather_seat", limit: 50
    t.integer "precision"
    t.integer "predicted_price"
    t.string "rear_image", limit: 100
    t.integer "revised_asking_price"
    t.string "seat_number", limit: 50
    t.integer "selling_price"
    t.string "side_image", limit: 100
    t.string "sunroof", limit: 50
    t.string "under_bonnet_image", limit: 100
    t.text "feedback_comment"
    t.integer "feedback_score"
    t.boolean "has_referral", null: false
    t.index ["model_id"], name: "vehicle_vehiclelead_model_id_efabd416"
    t.index ["user_id"], name: "vehicle_vehiclelead_user_id_bc898879"
    t.check_constraint "duplicate_to >= 0", name: "vehicle_vehiclelead_duplicate_to_check"
    t.unique_constraint ["vehicle_id"], name: "vehicle_vehiclelead_vehicle_id_2169bfc2_uniq"
  end

  create_table "vehicle_vehiclelead_flags", id: :serial, force: :cascade do |t|
    t.bigint "vehiclelead_id", null: false
    t.bigint "vehicleleadflags_id", null: false
    t.index ["vehiclelead_id"], name: "vehicle_vehiclelead_flags_vehiclelead_id_1b30c5e6"
    t.index ["vehicleleadflags_id"], name: "vehicle_vehiclelead_flags_vehicleleadflags_id_da39e0fe"
    t.unique_constraint ["vehiclelead_id", "vehicleleadflags_id"], name: "vehicle_vehiclelead_flag_vehiclelead_id_vehiclele_2d2328b5_uniq"
  end

  create_table "vehicle_vehicleleadbackup", force: :cascade do |t|
    t.string "lead_id", limit: 255, null: false
    t.string "model_id", limit: 255, null: false
    t.boolean "active", null: false
  end

  create_table "vehicle_vehicleleadflags", force: :cascade do |t|
    t.timestamptz "created", null: false
    t.timestamptz "modified", null: false
    t.string "name", limit: 50, null: false
  end

  create_table "vehicle_vehiclelisting", force: :cascade do |t|
    t.timestamptz "created", null: false
    t.timestamptz "modified", null: false
    t.float "selling_price", null: false
    t.boolean "active", null: false
    t.bigint "vehicle_id", null: false
    t.text "description"
    t.string "grade", limit: 10
    t.boolean "logbook_info_confirmed", null: false
    t.boolean "seller_verified", null: false
    t.string "title", limit: 45
    t.boolean "viewing_at_hq_available", null: false
    t.boolean "accident_free", null: false
    t.boolean "inspected_by_peach", null: false
    t.boolean "inspection_report_available", null: false
    t.boolean "mileage_verified_genuine", null: false
    t.bigint "cover_image_id"
    t.text "basic_features"
    t.text "driving_specs"
    t.text "interior_exterior"
    t.integer "mileage"
    t.string "sourced_from", limit: 5, null: false
    t.text "peach_assurance"
    t.text "meta_description"
    t.text "meta_keywords"
    t.bigint "location_id"
    t.bigint "current_status_id"
    t.bigint "sales_person_id"
    t.string "humanized_sale_turn_around_time", limit: 100
    t.bigint "seller_relation_manager_id"
    t.timestamptz "listed_on"
    t.index ["cover_image_id"], name: "vehicle_vehiclelisting_cover_image_id_6d576ee4"
    t.index ["current_status_id"], name: "vehicle_vehiclelisting_current_status_id_c6a58246"
    t.index ["location_id"], name: "vehicle_vehiclelisting_location_id_f5d9a433"
    t.index ["sales_person_id"], name: "vehicle_vehiclelisting_sales_person_id_433d9437"
    t.index ["seller_relation_manager_id"], name: "vehicle_vehiclelisting_seller_relation_manager_id_6db37370"
    t.index ["vehicle_id"], name: "vehicle_vehiclelisting_vehicle_id_e5c9ad26"
  end

  create_table "vehicle_vehiclelisting_tags", id: :serial, force: :cascade do |t|
    t.bigint "vehiclelisting_id", null: false
    t.bigint "tag_id", null: false
    t.index ["tag_id"], name: "vehicle_vehiclelisting_tags_tag_id_8c8d216e"
    t.index ["vehiclelisting_id"], name: "vehicle_vehiclelisting_tags_vehiclelisting_id_56a81b89"
    t.unique_constraint ["vehiclelisting_id", "tag_id"], name: "vehicle_vehiclelisting_t_vehiclelisting_id_tag_id_4973c2f8_uniq"
  end

  create_table "vehicle_vehiclelistingaction", id: :bigint, default: -> { "nextval('vehicle_listingaction_id_seq'::regclass)" }, force: :cascade do |t|
    t.timestamptz "created", null: false
    t.timestamptz "modified", null: false
    t.string "status", limit: 3, null: false
    t.text "status_explanation", null: false
    t.timestamptz "date", null: false
    t.boolean "active", null: false
    t.bigint "listing_id", null: false
    t.bigint "user_id"
    t.index ["listing_id"], name: "vehicle_listingaction_listing_id_d416db08"
    t.index ["user_id"], name: "vehicle_vehiclelistingaction_user_id_9275b62d"
  end

  create_table "vehicle_vehiclelistingimage", force: :cascade do |t|
    t.string "image", limit: 100
    t.string "name", limit: 45
    t.text "description"
    t.bigint "listing_id", null: false
    t.integer "order_no", null: false
    t.timestamptz "created", null: false
    t.timestamptz "modified", null: false
    t.boolean "is_processed", null: false
    t.index ["listing_id"], name: "vehicle_vehiclelistingimage_listing_id_9a906232"
  end

  create_table "vehicle_vehiclelistinglocation", force: :cascade do |t|
    t.timestamptz "created", null: false
    t.timestamptz "modified", null: false
    t.string "name", limit: 50, null: false
    t.index ["name"], name: "vehicle_vehiclelistinglocation_name_ef00fdc5_like", opclass: :varchar_pattern_ops
    t.unique_constraint ["name"], name: "vehicle_vehiclelistinglocation_name_key"
  end

  create_table "vehicle_vehiclelistingpricehistory", force: :cascade do |t|
    t.timestamptz "created", null: false
    t.timestamptz "modified", null: false
    t.string "selling_price", limit: 45, null: false
    t.bigint "listing_id", null: false
    t.index ["listing_id"], name: "vehicle_vehiclelistingpricehistory_listing_id_753e8b11"
  end

  create_table "vehicle_vehiclelistingsellerrelationmanagerhistory", force: :cascade do |t|
    t.timestamptz "created", null: false
    t.timestamptz "modified", null: false
    t.bigint "listing_id", null: false
    t.bigint "manager_id"
    t.index ["listing_id"], name: "vehicle_vehiclelistingsell_listing_id_a894ebdf"
    t.index ["manager_id"], name: "vehicle_vehiclelistingsell_manager_id_639d86a7"
  end

  create_table "vehicle_vehiclelistingwish", id: :bigint, default: -> { "nextval('vehicle_vehiclelistingwishlist_id_seq'::regclass)" }, force: :cascade do |t|
    t.timestamptz "created", null: false
    t.timestamptz "modified", null: false
    t.bigint "listing_id", null: false
    t.bigint "user_id", null: false
    t.index ["listing_id"], name: "vehicle_vehiclelistingwishlist_listing_id_d5b3f411"
    t.index ["user_id"], name: "vehicle_vehiclelistingwishlist_user_id_882231dc"
    t.unique_constraint ["listing_id", "user_id"], name: "vehicle_vehiclelistingwish_listing_id_user_id_1ff3b9d0_uniq"
  end

  create_table "vehicle_vehiclemodelbackup", force: :cascade do |t|
    t.string "model_id", limit: 255, null: false
    t.string "name", limit: 255, null: false
  end

  create_table "vehicle_vehicleowner", force: :cascade do |t|
    t.timestamptz "created", null: false
    t.timestamptz "modified", null: false
    t.string "contact_name", limit: 45
    t.string "contact_phone", limit: 45
    t.string "contact_email", limit: 45
    t.string "contact_type", limit: 5
    t.string "name", limit: 100
    t.string "entity", limit: 2
    t.string "identification_document_number", limit: 100
    t.string "kra_pin", limit: 20
    t.string "log_book", limit: 100
    t.bigint "vehicle_id", null: false
    t.date "end_date"
    t.date "start_date", null: false
    t.boolean "active", null: false
    t.bigint "user_id"
    t.string "document_type", limit: 2
    t.string "identification_document_photo", limit: 100
    t.index ["user_id"], name: "vehicle_vehicleowner_user_id_20df016a"
    t.index ["vehicle_id"], name: "vehicle_vehicleowner_vehicle_id_0ae67fe1"
  end

  add_foreign_key "assessment_assessmentdeductible", "assessment_assessmentdeductiblecategory", column: "category_id", name: "assessment_assessmen_category_id_68430088_fk_assessmen", deferrable: :deferred
  add_foreign_key "assessment_assessmentdeductibleforinspection", "assessment_assessmentdeductible", column: "deductible_id", name: "assessment_assessmen_deductible_id_145fcdf1_fk_assessmen", deferrable: :deferred
  add_foreign_key "assessment_assessmentdeductibleforinspection", "assessment_inspection", column: "inspection_id", name: "assessment_assessmen_inspection_id_32935c10_fk_assessmen", deferrable: :deferred
  add_foreign_key "assessment_assessmentimage", "assessment_scheduleassessment", column: "assessment_id", name: "assessment_assessmen_assessment_id_fbea5d87_fk_assessmen", deferrable: :deferred
  add_foreign_key "assessment_assessmentnote", "assessment_scheduleassessment", column: "schedule_id", name: "assessment_assessmen_schedule_id_8ab7d41b_fk_assessmen", deferrable: :deferred
  add_foreign_key "assessment_assessmentnote", "users_user", column: "user_id", name: "assessment_assessmentnote_user_id_8a93c05e_fk_users_user_id", deferrable: :deferred
  add_foreign_key "assessment_assessmentreport", "assessment_scheduleassessment", column: "schedule_id", name: "assessment_assessmen_schedule_id_faac1aed_fk_assessmen", deferrable: :deferred
  add_foreign_key "assessment_assessmentreport", "users_user", column: "approved_by_id", name: "assessment_assessmen_approved_by_id_c35d185e_fk_users_use", deferrable: :deferred
  add_foreign_key "assessment_carcare", "assessment_scheduleassessment", column: "schedule_id", name: "assessment_carcare_schedule_id_bc392596_fk_assessmen", deferrable: :deferred
  add_foreign_key "assessment_carcare", "assessment_workrequesttype", column: "work_request_id", name: "assessment_carcare_work_request_id_1d725677_fk_assessmen", deferrable: :deferred
  add_foreign_key "assessment_carcareinspectionitem", "assessment_attentionlevelstatus", column: "attention_level_status_id", name: "assessment_carcarein_attention_level_stat_6696b276_fk_assessmen", deferrable: :deferred
  add_foreign_key "assessment_carcareinspectionitem", "assessment_carcare", column: "car_care_id", name: "assessment_carcarein_car_care_id_d6841212_fk_assessmen", deferrable: :deferred
  add_foreign_key "assessment_carcareinspectionitem", "assessment_carcareinspectionitemtype", column: "item_type_id", name: "assessment_carcarein_item_type_id_f1ecf357_fk_assessmen", deferrable: :deferred
  add_foreign_key "assessment_carcareinspectionitem", "assessment_repairseveritylevel", column: "repair_severity_level_id", name: "assessment_carcarein_repair_severity_leve_7da917fc_fk_assessmen", deferrable: :deferred
  add_foreign_key "assessment_carcareinvoice", "assessment_carcare", column: "car_care_id", name: "assessment_carcarein_car_care_id_86e10af8_fk_assessmen", deferrable: :deferred
  add_foreign_key "assessment_carcareinvoiceitem", "assessment_carcareinvoice", column: "invoice_id", name: "assessment_carcarein_invoice_id_0010809e_fk_assessmen", deferrable: :deferred
  add_foreign_key "assessment_carcareinvoiceitem", "assessment_carcarequoteitem", column: "quote_item_id", name: "assessment_carcarein_quote_item_id_3a3c1b04_fk_assessmen", deferrable: :deferred
  add_foreign_key "assessment_carcarejobcard", "assessment_carcare", column: "car_care_id", name: "assessment_carcarejo_car_care_id_0884d3a0_fk_assessmen", deferrable: :deferred
  add_foreign_key "assessment_carcarejobcard_contractors", "assessment_carcarejobcard", column: "carcarejobcard_id", name: "assessment_carcarejo_carcarejobcard_id_7989d929_fk_assessmen", deferrable: :deferred
  add_foreign_key "assessment_carcarejobcard_contractors", "users_contractor", column: "contractor_id", name: "assessment_carcarejo_contractor_id_c9d8fdfd_fk_users_con", deferrable: :deferred
  add_foreign_key "assessment_carcarejobcard_technicians", "assessment_carcarejobcard", column: "carcarejobcard_id", name: "assessment_carcarejo_carcarejobcard_id_12071d24_fk_assessmen", deferrable: :deferred
  add_foreign_key "assessment_carcarejobcard_technicians", "users_user", column: "user_id", name: "assessment_carcarejo_user_id_db0e4cda_fk_users_use", deferrable: :deferred
  add_foreign_key "assessment_carcarejobcarditem", "assessment_carcarejobcard", column: "job_card_id", name: "assessment_ccjobcard_job_card_id_968ac187_fk_assessmen", deferrable: :deferred
  add_foreign_key "assessment_carcarejobcarditem", "assessment_carcarequoteitem", column: "quote_item_id", name: "assessment_carcarejo_quote_item_id_5fe03b43_fk_assessmen", deferrable: :deferred
  add_foreign_key "assessment_carcarelead", "vehicle_model", name: "assessment_carcarele_vehicle_model_id_e65e98ff_fk_vehicle_m", deferrable: :deferred
  add_foreign_key "assessment_carcarelead_flags", "assessment_carcarelead", column: "carcarelead_id", name: "assessment_carcarele_carcarelead_id_5bb91e07_fk_assessmen", deferrable: :deferred
  add_foreign_key "assessment_carcarelead_flags", "vehicle_vehicleleadflags", column: "vehicleleadflags_id", name: "assessment_carcarele_vehicleleadflags_id_09e614e8_fk_vehicle_v", deferrable: :deferred
  add_foreign_key "assessment_carcarepayment", "assessment_carcare", column: "car_care_id", name: "assessment_carcarepa_car_care_id_c4a6e95d_fk_assessmen", deferrable: :deferred
  add_foreign_key "assessment_carcarequote", "assessment_carcare", column: "car_care_id", name: "assessment_ccquote_car_care_id_e99b1401_fk_assessmen", deferrable: :deferred
  add_foreign_key "assessment_carcarequote", "assessment_carcarequote", column: "previous_quote_id", name: "assessment_carcarequ_previous_quote_id_30896b71_fk_assessmen", deferrable: :deferred
  add_foreign_key "assessment_carcarequoteitem", "assessment_carcarequote", column: "quote_id", name: "assessment_ccquoteit_quote_id_16e7f78f_fk_assessmen", deferrable: :deferred
  add_foreign_key "assessment_carcarequoteitem", "assessment_carcarerepair", column: "repair_id", name: "assessment_ccquoteit_repair_id_2a5abf2e_fk_assessmen", deferrable: :deferred
  add_foreign_key "assessment_carcarerepair", "assessment_carcare", column: "car_care_id", name: "assessment_carcarere_car_care_id_218d315c_fk_assessmen", deferrable: :deferred
  add_foreign_key "assessment_carcarerepair", "assessment_carcareinspectionitem", column: "inspection_item_id", name: "assessment_carcarere_inspection_item_id_7acbb4fb_fk_assessmen", deferrable: :deferred
  add_foreign_key "assessment_carcarerepair", "assessment_carcarewalkaroundcheckitem", column: "walk_around_check_item_id", name: "assessment_carcarere_walk_around_check_it_0243c8c9_fk_assessmen", deferrable: :deferred
  add_foreign_key "assessment_carcarerepair", "assessment_repairseveritylevel", column: "repair_severity_level_id", name: "assessment_carcarere_repair_severity_leve_562f0f76_fk_assessmen", deferrable: :deferred
  add_foreign_key "assessment_carcarerepair", "assessment_repairtype", column: "repair_type_id", name: "assessment_carcarere_repair_type_id_fa60cc05_fk_assessmen", deferrable: :deferred
  add_foreign_key "assessment_carcaretyreinspection", "assessment_carcare", column: "car_care_id", name: "assessment_carcarety_car_care_id_084f7fc6_fk_assessmen", deferrable: :deferred
  add_foreign_key "assessment_carcaretyreinspection", "assessment_tyrepositiononvehicle", column: "tyre_position_id", name: "assessment_carcarety_tyre_position_id_1984a4b6_fk_assessmen", deferrable: :deferred
  add_foreign_key "assessment_carcarewalkaroundcheckitem", "assessment_carcare", column: "car_care_id", name: "assessment_walkaroun_car_care_id_8376e637_fk_assessmen", deferrable: :deferred
  add_foreign_key "assessment_carcarewalkaroundcheckitem", "assessment_carcarewalkaroundchecktype", column: "walk_around_check_id", name: "assessment_carcarewa_walk_around_check_id_32f0aeda_fk_assessmen", deferrable: :deferred
  add_foreign_key "assessment_carcarewalkaroundcheckitem", "assessment_repairseveritylevel", column: "repair_severity_level_id", name: "assessment_carcarewa_repair_severity_leve_17c20fc1_fk_assessmen", deferrable: :deferred
  add_foreign_key "assessment_inspection", "assessment_scheduleassessment", column: "schedule_id", name: "assessment_inspectio_schedule_id_3c03e83d_fk_assessmen", deferrable: :deferred
  add_foreign_key "assessment_inspection_accident_severity", "assessment_accidentseverity", column: "accidentseverity_id", name: "assessment_inspectio_accidentseverity_id_7eab2927_fk_assessmen", deferrable: :deferred
  add_foreign_key "assessment_inspection_accident_severity", "assessment_inspection", column: "inspection_id", name: "assessment_inspectio_inspection_id_da2733c1_fk_assessmen", deferrable: :deferred
  add_foreign_key "assessment_inspectionimage", "assessment_inspection", column: "inspection_id", name: "assessment_inspectio_inspection_id_a16d0655_fk_assessmen", deferrable: :deferred
  add_foreign_key "assessment_inspectionrepairerror", "assessment_inspection", column: "inspection_id", name: "assessment_inspectio_inspection_id_953ebe52_fk_assessmen", deferrable: :deferred
  add_foreign_key "assessment_inspectionrepairerror", "assessment_repairseveritylevel", column: "repair_severity_level_id", name: "assessment_inspectio_repair_severity_leve_4282a8e8_fk_assessmen", deferrable: :deferred
  add_foreign_key "assessment_inspectionrepairerror", "assessment_repairtype", column: "repair_type_id", name: "assessment_inspectio_repair_type_id_bd00a96f_fk_assessmen", deferrable: :deferred
  add_foreign_key "assessment_inspectionyeargrade", "assessment_inspectionminage", column: "min_age_id", name: "assessment_inspectio_min_age_id_f33657b7_fk_assessmen", deferrable: :deferred
  add_foreign_key "assessment_preprescreening", "assessment_scheduleassessment", column: "schedule_id", name: "assessment_preprescr_schedule_id_1c4f85fa_fk_assessmen", deferrable: :deferred
  add_foreign_key "assessment_prescreening", "assessment_scheduleassessment", column: "schedule_id", name: "assessment_prescreen_schedule_id_523a5491_fk_assessmen", deferrable: :deferred
  add_foreign_key "assessment_prescreening", "users_user", column: "owner_id", name: "assessment_prescreening_owner_id_310a1abc_fk_users_user_id", deferrable: :deferred
  add_foreign_key "assessment_prescreeningimage", "assessment_prescreening", column: "pre_screening_id", name: "assessment_prescreen_pre_screening_id_7d99e41f_fk_assessmen", deferrable: :deferred
  add_foreign_key "assessment_prescreeningplus", "assessment_scheduleassessment", column: "schedule_id", name: "assessment_prescreen_schedule_id_f0031630_fk_assessmen", deferrable: :deferred
  add_foreign_key "assessment_prescreeningplusrepairerror", "assessment_repairseveritylevel", column: "repair_severity_level_id", name: "assessment_prescreen_repair_severity_leve_77b34b84_fk_assessmen", deferrable: :deferred
  add_foreign_key "assessment_prescreeningplusrepairerror", "assessment_repairtype", column: "repair_type_id", name: "assessment_prescreen_repair_type_id_6d2aac82_fk_assessmen", deferrable: :deferred
  add_foreign_key "assessment_scheduleassessment", "vehicle_vehicle", column: "vehicle_id", name: "assessment_schedulea_vehicle_id_ee041297_fk_vehicle_v", deferrable: :deferred
  add_foreign_key "assessment_scheduleassessment_technicians", "assessment_scheduleassessment", column: "scheduleassessment_id", name: "assessment_schedulea_scheduleassessment_i_74ab9c89_fk_assessmen", deferrable: :deferred
  add_foreign_key "assessment_scheduleassessment_technicians", "users_user", column: "user_id", name: "assessment_schedulea_user_id_56d66c65_fk_users_use", deferrable: :deferred
  add_foreign_key "assessment_tyre", "assessment_inspection", column: "inspection_id", name: "assessment_tyre_inspection_id_27d922fa_fk_assessmen", deferrable: :deferred
  add_foreign_key "auth_group_permissions", "auth_group", column: "group_id", name: "auth_group_permissions_group_id_b120cbf9_fk_auth_group_id", deferrable: :deferred
  add_foreign_key "auth_group_permissions", "auth_permission", column: "permission_id", name: "auth_group_permissio_permission_id_84c5c92e_fk_auth_perm", deferrable: :deferred
  add_foreign_key "auth_permission", "django_content_type", column: "content_type_id", name: "auth_permission_content_type_id_2f476e4b_fk_django_co", deferrable: :deferred
  add_foreign_key "authtoken_token", "users_user", column: "user_id", name: "authtoken_token_user_id_35299eff_fk_users_user_id", deferrable: :deferred
  add_foreign_key "core_identificationdocumentsaccesslog", "users_user", column: "user_id", name: "core_identificationd_user_id_3ea39fbb_fk_users_use", deferrable: :deferred
  add_foreign_key "core_identificationdocumentsaccesslog", "vehicle_vehicleowner", column: "document_data_id", name: "core_identificationd_document_data_id_4c8e46d8_fk_vehicle_v", deferrable: :deferred
  add_foreign_key "core_logbookaccesslog", "users_user", column: "user_id", name: "core_logbookaccesslog_user_id_77167240_fk_users_user_id", deferrable: :deferred
  add_foreign_key "core_logbookaccesslog", "vehicle_vehicleowner", column: "logbook_data_id", name: "core_logbookaccesslo_logbook_data_id_ca3bb77e_fk_vehicle_v", deferrable: :deferred
  add_foreign_key "core_logprescreening", "assessment_prescreening", column: "inspection_id", name: "core_logprescreening_inspection_id_244eb2b8_fk_assessmen", deferrable: :deferred
  add_foreign_key "core_logprescreening", "users_user", column: "user_id", name: "core_logprescreening_user_id_6d36d61c_fk_users_user_id", deferrable: :deferred
  add_foreign_key "django_admin_log", "django_content_type", column: "content_type_id", name: "django_admin_log_content_type_id_c4bce8eb_fk_django_co", deferrable: :deferred
  add_foreign_key "django_admin_log", "users_user", column: "user_id", name: "django_admin_log_user_id_c564eba6_fk_users_user_id", deferrable: :deferred
  add_foreign_key "users_contractor_contractor_roles", "users_contractor", column: "contractor_id", name: "users_contractor_con_contractor_id_8eb9e1c9_fk_users_con", deferrable: :deferred
  add_foreign_key "users_contractor_contractor_roles", "users_contractorrole", column: "contractorrole_id", name: "users_contractor_con_contractorrole_id_b2c5defb_fk_users_con", deferrable: :deferred
  add_foreign_key "users_duplicateuser_groups", "auth_group", column: "group_id", name: "users_duplicateuser_groups_group_id_f2e0206b_fk_auth_group_id", deferrable: :deferred
  add_foreign_key "users_duplicateuser_groups", "users_duplicateuser", column: "duplicateuser_id", name: "users_duplicateuser__duplicateuser_id_e6a8e006_fk_users_dup", deferrable: :deferred
  add_foreign_key "users_duplicateuser_roles", "users_duplicateuser", column: "duplicateuser_id", name: "users_duplicateuser__duplicateuser_id_7c1d1b33_fk_users_dup", deferrable: :deferred
  add_foreign_key "users_duplicateuser_roles", "users_userrole", column: "userrole_id", primary_key: "slug", name: "users_duplicateuser__userrole_id_c06720fb_fk_users_use", deferrable: :deferred
  add_foreign_key "users_duplicateuser_user_permissions", "auth_permission", column: "permission_id", name: "users_duplicateuser__permission_id_58f9b9aa_fk_auth_perm", deferrable: :deferred
  add_foreign_key "users_duplicateuser_user_permissions", "users_duplicateuser", column: "duplicateuser_id", name: "users_duplicateuser__duplicateuser_id_2375ed7f_fk_users_dup", deferrable: :deferred
  add_foreign_key "users_user_groups", "auth_group", column: "group_id", name: "users_user_groups_group_id_9afc8d0e_fk_auth_group_id", deferrable: :deferred
  add_foreign_key "users_user_groups", "users_user", column: "user_id", name: "users_user_groups_user_id_5f6f5a90_fk_users_user_id", deferrable: :deferred
  add_foreign_key "users_user_roles", "users_user", column: "user_id", name: "users_user_roles_user_id_f0af70c6_fk_users_user_id", deferrable: :deferred
  add_foreign_key "users_user_roles", "users_userrole", column: "userrole_id", primary_key: "slug", name: "users_user_roles_userrole_id_4db5dac4_fk_users_userrole_slug", deferrable: :deferred
  add_foreign_key "users_user_user_permissions", "auth_permission", column: "permission_id", name: "users_user_user_perm_permission_id_0b93982e_fk_auth_perm", deferrable: :deferred
  add_foreign_key "users_user_user_permissions", "users_user", column: "user_id", name: "users_user_user_permissions_user_id_20aca447_fk_users_user_id", deferrable: :deferred
  add_foreign_key "users_userrole", "auth_group", column: "group_id", name: "users_userrole_group_id_db0bb43b_fk_auth_group_id", deferrable: :deferred
  add_foreign_key "vehicle_deletedvehiclelistingimagearchive", "vehicle_vehiclelisting", column: "listing_id", name: "vehicle_deletedvehic_listing_id_d896c582_fk_vehicle_v", deferrable: :deferred
  add_foreign_key "vehicle_duplicatevehicle", "users_user", column: "current_owner_id", name: "vehicle_duplicateveh_current_owner_id_38fae350_fk_users_use", deferrable: :deferred
  add_foreign_key "vehicle_duplicatevehicle", "vehicle_model", column: "model_id", name: "vehicle_duplicatevehicle_model_id_e833da29_fk_vehicle_model_id", deferrable: :deferred
  add_foreign_key "vehicle_duplicatevehicle", "vehicle_trim", column: "trim_id", name: "vehicle_duplicatevehicle_trim_id_6be75968_fk_vehicle_trim_id", deferrable: :deferred
  add_foreign_key "vehicle_duplicatevehicle", "vehicle_vehicleimage", column: "cover_image_id", name: "vehicle_duplicateveh_cover_image_id_6635459f_fk_vehicle_v", deferrable: :deferred
  add_foreign_key "vehicle_duplicatevehicle_tags", "vehicle_duplicatevehicle", column: "duplicatevehicle_id", name: "vehicle_duplicateveh_duplicatevehicle_id_6fcbd288_fk_vehicle_d", deferrable: :deferred
  add_foreign_key "vehicle_duplicatevehicle_tags", "vehicle_tag", column: "tag_id", name: "vehicle_duplicatevehicle_tags_tag_id_00c6dfbf_fk_vehicle_tag_id", deferrable: :deferred
  add_foreign_key "vehicle_duplicatevehiclelead", "users_user", column: "user_id", name: "vehicle_duplicatevehiclelead_user_id_5d72b0fa_fk_users_user_id", deferrable: :deferred
  add_foreign_key "vehicle_duplicatevehiclelead", "vehicle_model", column: "model_id", name: "vehicle_duplicateveh_model_id_9035ebbd_fk_vehicle_m", deferrable: :deferred
  add_foreign_key "vehicle_duplicatevehiclelead", "vehicle_vehicle", column: "vehicle_id", name: "vehicle_duplicateveh_vehicle_id_b8bb8af1_fk_vehicle_v", deferrable: :deferred
  add_foreign_key "vehicle_duplicatevehiclelead_flags", "vehicle_duplicatevehiclelead", column: "duplicatevehiclelead_id", name: "vehicle_duplicateveh_duplicatevehiclelead_aec0a3f9_fk_vehicle_d", deferrable: :deferred
  add_foreign_key "vehicle_duplicatevehiclelead_flags", "vehicle_vehicleleadflags", column: "vehicleleadflags_id", name: "vehicle_duplicateveh_vehicleleadflags_id_0842c6b5_fk_vehicle_v", deferrable: :deferred
  add_foreign_key "vehicle_model", "vehicle_make", column: "make_id", name: "vehicle_model_make_id_8b3ca66c_fk_vehicle_make_id", deferrable: :deferred
  add_foreign_key "vehicle_modelcode", "vehicle_model", column: "model_id", name: "vehicle_modelcode_model_id_52f58c98_fk_vehicle_model_id", deferrable: :deferred
  add_foreign_key "vehicle_offer", "users_user", column: "agent_id", name: "vehicle_offer_agent_id_574d247f_fk_users_user_id", deferrable: :deferred
  add_foreign_key "vehicle_offer", "vehicle_vehiclebuyerlead", column: "lead_id", name: "vehicle_offer_lead_id_3f2fd781_fk_vehicle_vehiclebuyerlead_id", deferrable: :deferred
  add_foreign_key "vehicle_referral", "vehicle_vehiclebuyerlead", column: "buyer_lead_id", name: "vehicle_referral_buyer_lead_id_f241ffdf_fk_vehicle_v", deferrable: :deferred
  add_foreign_key "vehicle_referral", "vehicle_vehiclelead", column: "vehicle_lead_id", name: "vehicle_referral_vehicle_lead_id_47bccfa9_fk_vehicle_v", deferrable: :deferred
  add_foreign_key "vehicle_series", "vehicle_model", column: "model_id", name: "vehicle_series_model_id_7c85df86_fk_vehicle_model_id", deferrable: :deferred
  add_foreign_key "vehicle_showroomvisit", "users_user", column: "seller_agent_id", name: "vehicle_showroomvisit_seller_agent_id_6f3262d3_fk_users_user_id", deferrable: :deferred
  add_foreign_key "vehicle_showroomvisit", "vehicle_vehiclebuyerlead", column: "lead_id", name: "vehicle_showroomvisi_lead_id_db3c9d39_fk_vehicle_v", deferrable: :deferred
  add_foreign_key "vehicle_trim", "vehicle_model", column: "model_id", name: "vehicle_trim_model_id_2815cc64_fk_vehicle_model_id", deferrable: :deferred
  add_foreign_key "vehicle_trim", "vehicle_series", column: "series_id", name: "vehicle_trim_series_id_a972dc3e_fk_vehicle_series_id", deferrable: :deferred
  add_foreign_key "vehicle_vehicle", "users_user", column: "current_owner_id", name: "vehicle_vehicle_current_owner_id_80ccfcfb_fk_users_user_id", deferrable: :deferred
  add_foreign_key "vehicle_vehicle", "vehicle_model", column: "model_id", name: "vehicle_vehicle_model_id_7f174222_fk_vehicle_model_id", deferrable: :deferred
  add_foreign_key "vehicle_vehicle", "vehicle_trim", column: "trim_id", name: "vehicle_vehicle_trim_id_c3732b97_fk_vehicle_trim_id", deferrable: :deferred
  add_foreign_key "vehicle_vehicle", "vehicle_vehicleimage", column: "cover_image_id", name: "vehicle_vehicle_cover_image_id_a6e0f274_fk_vehicle_v", deferrable: :deferred
  add_foreign_key "vehicle_vehicle_tags", "vehicle_tag", column: "tag_id", name: "vehicle_vehicle_tags_tag_id_ac778624_fk_vehicle_tag_id", deferrable: :deferred
  add_foreign_key "vehicle_vehicle_tags", "vehicle_vehicle", column: "vehicle_id", name: "vehicle_vehicle_tags_vehicle_id_57224fba_fk_vehicle_vehicle_id", deferrable: :deferred
  add_foreign_key "vehicle_vehiclebuyerlead", "vehicle_vehiclelisting", column: "vehicle_listing_id", name: "vehicle_vehiclebuyer_vehicle_listing_id_3020f12c_fk_vehicle_v", deferrable: :deferred
  add_foreign_key "vehicle_vehiclebuyerlead_flags", "vehicle_vehiclebuyerlead", column: "vehiclebuyerlead_id", name: "vehicle_vehiclebuyer_vehiclebuyerlead_id_71acce96_fk_vehicle_v", deferrable: :deferred
  add_foreign_key "vehicle_vehiclebuyerlead_flags", "vehicle_vehicleleadflags", column: "vehicleleadflags_id", name: "vehicle_vehiclebuyer_vehicleleadflags_id_1eb2d92c_fk_vehicle_v", deferrable: :deferred
  add_foreign_key "vehicle_vehiclecontactinfo", "vehicle_vehicle", column: "vehicle_id", name: "vehicle_vehicleconta_vehicle_id_efabe1f1_fk_vehicle_v", deferrable: :deferred
  add_foreign_key "vehicle_vehiclegallery", "users_user", column: "uploaded_by_id", name: "vehicle_vehiclegallery_uploaded_by_id_f45d2e59_fk_users_user_id", deferrable: :deferred
  add_foreign_key "vehicle_vehiclegallery", "vehicle_vehicle", column: "vehicle_id", name: "vehicle_vehiclegalle_vehicle_id_9d298557_fk_vehicle_v", deferrable: :deferred
  add_foreign_key "vehicle_vehiclegallery", "vehicle_vehiclelead", column: "vehicle_lead_id", name: "vehicle_vehiclegalle_vehicle_lead_id_4467ab30_fk_vehicle_v", deferrable: :deferred
  add_foreign_key "vehicle_vehicleimage", "vehicle_vehiclegallery", column: "gallery_id", name: "vehicle_vehicleimage_gallery_id_784f5b69_fk_vehicle_v", deferrable: :deferred
  add_foreign_key "vehicle_vehiclelead", "users_user", column: "user_id", name: "vehicle_vehiclelead_user_id_bc898879_fk_users_user_id", deferrable: :deferred
  add_foreign_key "vehicle_vehiclelead", "vehicle_model", column: "model_id", name: "vehicle_vehiclelead_model_id_efabd416_fk_vehicle_model_id", deferrable: :deferred
  add_foreign_key "vehicle_vehiclelead", "vehicle_vehicle", column: "vehicle_id", name: "vehicle_vehiclelead_vehicle_id_2169bfc2_fk_vehicle_vehicle_id", deferrable: :deferred
  add_foreign_key "vehicle_vehiclelead_flags", "vehicle_vehiclelead", column: "vehiclelead_id", name: "vehicle_vehiclelead__vehiclelead_id_1b30c5e6_fk_vehicle_v", deferrable: :deferred
  add_foreign_key "vehicle_vehiclelead_flags", "vehicle_vehicleleadflags", column: "vehicleleadflags_id", name: "vehicle_vehiclelead__vehicleleadflags_id_da39e0fe_fk_vehicle_v", deferrable: :deferred
  add_foreign_key "vehicle_vehiclelisting", "users_user", column: "sales_person_id", name: "vehicle_vehiclelisti_sales_person_id_433d9437_fk_users_use", deferrable: :deferred
  add_foreign_key "vehicle_vehiclelisting", "users_user", column: "seller_relation_manager_id", name: "vehicle_vehiclelisti_seller_relation_mana_6db37370_fk_users_use", deferrable: :deferred
  add_foreign_key "vehicle_vehiclelisting", "vehicle_vehicle", column: "vehicle_id", name: "vehicle_vehiclelisti_vehicle_id_e5c9ad26_fk_vehicle_v", deferrable: :deferred
  add_foreign_key "vehicle_vehiclelisting", "vehicle_vehiclelistingaction", column: "current_status_id", name: "vehicle_vehiclelisti_current_status_id_c6a58246_fk_vehicle_v", deferrable: :deferred
  add_foreign_key "vehicle_vehiclelisting", "vehicle_vehiclelistingimage", column: "cover_image_id", name: "vehicle_vehiclelisti_cover_image_id_6d576ee4_fk_vehicle_v", deferrable: :deferred
  add_foreign_key "vehicle_vehiclelisting", "vehicle_vehiclelistinglocation", column: "location_id", name: "vehicle_vehiclelisti_location_id_f5d9a433_fk_vehicle_v", deferrable: :deferred
  add_foreign_key "vehicle_vehiclelisting_tags", "vehicle_tag", column: "tag_id", name: "vehicle_vehiclelisting_tags_tag_id_8c8d216e_fk_vehicle_tag_id", deferrable: :deferred
  add_foreign_key "vehicle_vehiclelisting_tags", "vehicle_vehiclelisting", column: "vehiclelisting_id", name: "vehicle_vehiclelisti_vehiclelisting_id_56a81b89_fk_vehicle_v", deferrable: :deferred
  add_foreign_key "vehicle_vehiclelistingaction", "users_user", column: "user_id", name: "vehicle_vehiclelistingaction_user_id_9275b62d_fk_users_user_id", deferrable: :deferred
  add_foreign_key "vehicle_vehiclelistingaction", "vehicle_vehiclelisting", column: "listing_id", name: "vehicle_listingactio_listing_id_d416db08_fk_vehicle_v", deferrable: :deferred
  add_foreign_key "vehicle_vehiclelistingimage", "vehicle_vehiclelisting", column: "listing_id", name: "vehicle_vehiclelisti_listing_id_9a906232_fk_vehicle_v", deferrable: :deferred
  add_foreign_key "vehicle_vehiclelistingpricehistory", "vehicle_vehiclelisting", column: "listing_id", name: "vehicle_vehiclelisti_listing_id_753e8b11_fk_vehicle_v", deferrable: :deferred
  add_foreign_key "vehicle_vehiclelistingsellerrelationmanagerhistory", "users_user", column: "manager_id", name: "vehicle_vehiclelisti_manager_id_639d86a7_fk_users_use", deferrable: :deferred
  add_foreign_key "vehicle_vehiclelistingsellerrelationmanagerhistory", "vehicle_vehiclelisting", column: "listing_id", name: "vehicle_vehiclelisti_listing_id_a894ebdf_fk_vehicle_v", deferrable: :deferred
  add_foreign_key "vehicle_vehiclelistingwish", "users_user", column: "user_id", name: "vehicle_vehiclelisti_user_id_882231dc_fk_users_use", deferrable: :deferred
  add_foreign_key "vehicle_vehiclelistingwish", "vehicle_vehiclelisting", column: "listing_id", name: "vehicle_vehiclelisti_listing_id_d5b3f411_fk_vehicle_v", deferrable: :deferred
  add_foreign_key "vehicle_vehicleowner", "users_user", column: "user_id", name: "vehicle_vehicleowner_user_id_20df016a_fk_users_user_id", deferrable: :deferred
  add_foreign_key "vehicle_vehicleowner", "vehicle_vehicle", column: "vehicle_id", name: "vehicle_vehicleowner_vehicle_id_0ae67fe1_fk_vehicle_vehicle_id", deferrable: :deferred
end
