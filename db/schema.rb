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

ActiveRecord::Schema.define(version: 2020_01_23_123623) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table " lis_consumable_transaction", primary_key: "ct_test_transaction_id", id: :bigint, default: nil, force: :cascade do |t|
    t.float "ct_stock_quantity"
    t.string "ct_transaction_type", limit: 250
    t.text "ct_remark"
    t.bigint "ct_transaction_by"
    t.datetime "ct_date_time"
    t.float "ct_remaining_stock"
    t.string "ct_challan_no", limit: 250
    t.string "ct_batch_no", limit: 250
    t.string "ct_manufacturer", limit: 250
    t.date "ct_expiry"
    t.float "ct_cost"
    t.integer "ct_status", limit: 2
    t.integer "ct_msg_sent", limit: 2
    t.integer "ct_email_sent", limit: 2
    t.bigint "ct_consumable_id"
  end

  create_table "analytical_machine", primary_key: "am_instrument_id", id: :string, limit: 255, force: :cascade do |t|
    t.string "am_opd_code", limit: 4, null: false
    t.string "am_instrument_name", limit: 255, null: false
    t.string "am_ip_address", limit: 255
    t.string "am_current_status", limit: 255, null: false
    t.text "am_service_address_and_email"
    t.datetime "am_date_of_installation"
    t.string "am_warranty_period", limit: 25
    t.string "am_service_coverage_period", limit: 25
    t.string "am_rate_per_annum", limit: 25
    t.index ["am_instrument_name"], name: "idx_21484_am_instrument_name_idx"
    t.index ["am_opd_code"], name: "idx_21484_fk_analytical_machine_opd_idx"
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string "city_name", limit: 255, null: false
    t.bigint "sid", null: false
    t.string "state_name", limit: 255, null: false
  end

  create_table "consumable_transaction", id: false, force: :cascade do |t|
    t.float "ct_stock_quantity"
    t.string "ct_transaction_type", limit: 55
    t.text "ct_remark"
    t.decimal "ct_transaction_by"
    t.datetime "ct_date_time"
    t.float "ct_remaining_stock", default: 0.0
    t.string "ct_challan_no", limit: 255
    t.string "ct_batch_no", limit: 255
    t.string "ct_manufacturer", limit: 255
    t.date "ct_expiry"
    t.float "ct_cost", default: 0.0
    t.boolean "ct_msg_sent", default: false
    t.boolean "ct_email_sent", default: false
    t.bigint "ct_created_by"
    t.bigint "ct_pathology"
    t.string "ct_sku", limit: 50
    t.string "ct_purchase_uom", limit: 50
    t.date "ct_purchase_date"
    t.integer "ct_status", limit: 2
    t.bigint "ct_consumable_id"
    t.serial "ct_test_transaction_id", null: false
  end

  create_table "consumable_types", force: :cascade do |t|
    t.string "inv_consumable_types"
  end

  create_table "created_test_order", force: :cascade do |t|
    t.string "doctor", limit: 255
    t.string "name", limit: 255
    t.string "contact", limit: 20
    t.string "contact1", limit: 20
    t.string "address", limit: 255
    t.string "pin_code", limit: 10
    t.string "container", limit: 200
    t.string "specimen_type", limit: 100
    t.string "report_time", limit: 100
    t.bigint "order_no"
    t.integer "status", limit: 2
  end

  create_table "doctors", force: :cascade do |t|
    t.string "fname", limit: 255
    t.string "lname", limit: 255
    t.string "email", limit: 255
    t.string "gender", limit: 50
    t.string "address", limit: 255
    t.string "country", limit: 200
    t.integer "pin_code"
    t.string "payby", limit: 200
    t.string "paymode", limit: 200
    t.string "password", limit: 255
    t.datetime "created"
    t.string "profile_image", limit: 255
    t.boolean "is_verified"
    t.bigint "mobile"
    t.bigint "state"
    t.bigint "city"
    t.integer "status", limit: 2
  end

  create_table "external_users", force: :cascade do |t|
    t.string "fname", limit: 250, null: false
    t.string "lname", limit: 25
    t.string "email", limit: 100, null: false
    t.string "password", limit: 250, null: false
    t.string "gender", limit: 10, null: false
    t.string "address", limit: 250
    t.string "city", limit: 100
    t.string "state", limit: 100
    t.bigint "pin"
    t.bigint "mobile"
    t.bigint "alternate_number"
    t.string "dob", limit: 100
    t.bigint "age"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inv1", id: false, force: :cascade do |t|
  end

  create_table "inventory", primary_key: "inv_consumable_id", force: :cascade do |t|
    t.string "inv_consumable_types", limit: 255, null: false
    t.string "inv_consumable_name", limit: 255, null: false
    t.string "inv_consumable_sku", limit: 255
    t.string "inv_usage_uom", limit: 55
    t.string "inv_purchase_uom", limit: 55
    t.datetime "inv_purchased_date_time"
    t.date "inv_expiry_date"
    t.bigint "inv_created_by"
    t.bigint "inv_pathology"
    t.bigint "inv_stock_in_hand"
    t.bigint "inv_reorder_status"
    t.bigint "inv_stock_reorder_level"
  end

  create_table "inventory_issue", primary_key: "ii_issue_id", force: :cascade do |t|
    t.text "ii_consumable_detail"
    t.decimal "ii_requested_by", default: "0.0", null: false
    t.datetime "ii_requested_date"
    t.decimal "ii_issued_by", default: "0.0", null: false
    t.datetime "ii_issued_date"
    t.text "ii_comment"
    t.bigint "ii_pathology", null: false
    t.integer "ii_status", limit: 2
    t.string "consumable_type", limit: 100
    t.bigint "consumable_id"
    t.bigint "quantity"
  end

  create_table "inventory_notification", primary_key: "in_notification_id", force: :cascade do |t|
    t.text "in_notification"
    t.decimal "in_sent_to", default: "0.0", null: false
    t.datetime "in_created"
    t.string "in_notification_type", limit: 255
    t.integer "in_status", limit: 2
    t.integer "in_deleted", limit: 2
    t.integer "in_archive", limit: 2
    t.datetime "in_read_at"
  end

  create_table "lab_test_master", id: false, force: :cascade do |t|
    t.bigint "ltm_procedure_type_id", null: false
    t.string "ltm_procedure_code", limit: 31, null: false
    t.string "ltm_analyzer_test_code", limit: 31
    t.string "ltm_instrument_name", limit: 255
    t.string "ltm_opd_code", limit: 4
    t.bigint "ltm_parent", default: 0, null: false
    t.string "ltm_test_name", limit: 255, null: false
    t.bigint "ltm_consumable_id"
    t.string "ltm_uom", limit: 55
    t.float "ltm_per_test_usage"
    t.float "ltm_per_test_cost"
    t.text "ltm_description"
    t.string "ltm_test_handler", limit: 255
    t.string "ltm_slab1_from", limit: 25
    t.string "ltm_slab1_to", limit: 25
    t.string "ltm_slab1_lower", limit: 25
    t.string "ltm_slab1_upper", limit: 25
    t.text "ltm_slab1_output_note"
    t.string "ltm_slab2_from", limit: 25
    t.string "ltm_slab2_to", limit: 25
    t.string "ltm_slab2_lower", limit: 25
    t.string "ltm_slab2_upper", limit: 25
    t.text "ltm_slab2_output_note"
    t.string "ltm_slab3_from", limit: 25
    t.string "ltm_slab3_to", limit: 25
    t.string "ltm_slab3_lower", limit: 25
    t.string "ltm_slab3_upper", limit: 25
    t.text "ltm_slab3_output_note"
    t.string "ltm_slab4_from", limit: 25
    t.string "ltm_slab4_to", limit: 25
    t.string "ltm_slab4_lower", limit: 25
    t.string "ltm_slab4_upper", limit: 25
    t.text "ltm_slab4_output_note"
    t.string "ltm_slab5_from", limit: 25
    t.string "ltm_slab5_to", limit: 25
    t.string "ltm_slab5_lower", limit: 25
    t.string "ltm_slab5_upper", limit: 25
    t.text "ltm_slab5_output_note"
    t.string "ltm_slab6_from", limit: 25
    t.string "ltm_slab6_to", limit: 25
    t.string "ltm_slab6_lower", limit: 25
    t.string "ltm_slab6_upper", limit: 25
    t.text "ltm_slab6_output_note"
    t.string "ltm_slab1_male_from", limit: 25
    t.string "ltm_slab1_male_to", limit: 25
    t.string "ltm_slab1_male_lower", limit: 25
    t.string "ltm_slab1_male_upper", limit: 25
    t.text "ltm_slab1_male_output_note"
    t.string "ltm_slab2_male_from", limit: 25
    t.string "ltm_slab2_male_to", limit: 25
    t.string "ltm_slab2_male_lower", limit: 25
    t.string "ltm_slab2_male_upper", limit: 25
    t.text "ltm_slab2_male_output_note"
    t.string "ltm_slab3_male_from", limit: 25
    t.string "ltm_slab3_male_to", limit: 25
    t.string "ltm_slab3_male_lower", limit: 25
    t.string "ltm_slab3_male_upper", limit: 25
    t.text "ltm_slab3_male_output_note"
    t.string "ltm_slab4_male_from", limit: 25
    t.string "ltm_slab4_male_to", limit: 25
    t.string "ltm_slab4_male_lower", limit: 25
    t.string "ltm_slab4_male_upper", limit: 25
    t.text "ltm_slab4_male_output_note"
    t.string "ltm_slab1_female_from", limit: 25
    t.string "ltm_slab1_female_to", limit: 25
    t.string "ltm_slab1_female_lower", limit: 25
    t.string "ltm_slab1_female_upper", limit: 25
    t.text "ltm_slab1_female_output_note"
    t.string "ltm_slab2_female_from", limit: 25
    t.string "ltm_slab2_female_to", limit: 25
    t.string "ltm_slab2_female_lower", limit: 25
    t.string "ltm_slab2_female_upper", limit: 25
    t.text "ltm_slab2_female_output_note"
    t.string "ltm_slab3_female_from", limit: 25
    t.string "ltm_slab3_female_to", limit: 25
    t.string "ltm_slab3_female_lower", limit: 25
    t.string "ltm_slab3_female_upper", limit: 25
    t.text "ltm_slab3_female_output_note"
    t.string "ltm_slab4_female_from", limit: 25
    t.string "ltm_slab4_female_to", limit: 25
    t.string "ltm_slab4_female_lower", limit: 25
    t.string "ltm_slab4_female_upper", limit: 25
    t.text "ltm_slab4_female_output_note"
    t.string "ltm_pregnant_lower", limit: 25
    t.string "ltm_pregnant_upper", limit: 25
    t.string "ltm_result_type", limit: 25
    t.string "ltm_calculated_on", limit: 25
    t.string "ltm_specimen_source", limit: 128
    t.string "ltm_specimen_type", limit: 31
    t.string "ltm_specimen_vial", limit: 55
    t.string "ltm_specimen_uom", limit: 55
    t.string "ltm_specimen_quantity", limit: 30
    t.string "ltm_feed_result_template", limit: 200, null: false
    t.string "ltm_print_report_template", limit: 200, null: false
    t.integer "ltm_seq", default: 0, null: false
    t.text "ltm_formula"
    t.text "ltm_method_change_to"
    t.bigint "ltm_test_code_id", default: -> { "nextval('lis_lab_test_master_ltm_test_code_id_seq'::regclass)" }, null: false
    t.bigint "ltm_provider_id", default: 0
    t.float "ltm_test_mrp", default: 0.0
    t.text "ltm_reporting_date"
    t.integer "ltm_is_outside", default: 0
    t.string "ltm_provider_title"
  end

  create_table "order_tests", primary_key: "ot_test_transaction_id", force: :cascade do |t|
    t.decimal "ot_test_order_id"
    t.decimal "ot_test_code_id"
    t.bigint "pannel_id"
    t.index ["ot_test_code_id"], name: "idx_21157_fk_lis_order_tests_lis_lab_test_master_idx"
    t.index ["ot_test_code_id"], name: "idx_21567_fk_lis_order_tests_lis_lab_test_master_idx"
    t.index ["ot_test_order_id"], name: "idx_21157_fk_order_tests_test_orders_idx"
    t.index ["ot_test_order_id"], name: "idx_21567_fk_order_tests_test_orders_idx"
  end

  create_table "order_transfer_master", id: false, force: :cascade do |t|
    t.bigserial "id", null: false
    t.integer "no_of_order", default: 0
    t.bigint "provider_id", default: 0
    t.string "provider_title"
    t.serial "send_by_id", null: false
    t.string "send_by_name"
    t.integer "carried_by_id", default: 0
    t.string "carried_by_name"
    t.datetime "transfer_date"
    t.integer "is_recieved", default: 0
    t.datetime "recieved_date"
    t.serial "no_of_sample", null: false
  end

  create_table "otp", force: :cascade do |t|
    t.datetime "expire_time"
    t.string "otp", limit: 25
    t.datetime "start_time"
    t.integer "status", limit: 2
    t.string "user_type", limit: 35
    t.bigint "mobile"
  end

  create_table "patients", primary_key: "pt_lis_patient_id", force: :cascade do |t|
    t.string "pt_opd_code", limit: 4
    t.string "pt_fname", limit: 255
    t.string "pt_mname", limit: 255
    t.string "pt_lname", limit: 255
    t.date "pt_dob"
    t.bigint "pt_age", default: 0, null: false
    t.boolean "pt_is_tentative_age", default: false, null: false
    t.string "pt_street", limit: 255
    t.string "pt_city", limit: 255
    t.string "pt_state", limit: 255
    t.string "pt_country", limit: 255
    t.string "pt_zip", limit: 255
    t.string "pt_mobile", limit: 255
    t.string "pt_sex", limit: 255
    t.string "pt_bpl_status", limit: 255
    t.datetime "pt_created_date"
    t.string "pt_mobile_alt"
    t.string "pt_email"
    t.index ["pt_opd_code"], name: "idx_21166_fk_lis_patients_opd_idx"
    t.index ["pt_opd_code"], name: "idx_21576_fk_lis_patients_opd_idx"
  end

  create_table "provider_day_test_count", id: :serial, force: :cascade do |t|
    t.bigint "provider_id"
    t.date "cur_date"
    t.float "total_mrp"
    t.bigint "total_count"
    t.integer "status"
  end

  create_table "provider_test_map", id: :serial, force: :cascade do |t|
    t.bigint "provider_id"
    t.bigint "test_id"
    t.float "test_mrp"
    t.string "container_type", limit: 255
    t.string "reporting_day", limit: 255
    t.text "remark_on_container"
    t.text "remark"
    t.datetime "created_time"
    t.datetime "updated_time"
    t.integer "status"
    t.text "common_name"
    t.bigint "max_count"
    t.float "doctor_fee"
  end

  create_table "providers", force: :cascade do |t|
    t.string "fname", limit: 255
    t.string "lname", limit: 255
    t.string "provider_title", limit: 255
    t.string "email", limit: 255
    t.string "mobile", limit: 15
    t.string "contact", limit: 25
    t.string "address", limit: 255
    t.string "state", limit: 255
    t.string "city", limit: 255
    t.integer "pin_code"
    t.bigint "created_by"
    t.datetime "created_date"
    t.datetime "last_update"
    t.integer "pro_priority"
    t.string "schedule_type"
    t.string "limit_start"
    t.string "limit_end"
    t.integer "status"
    t.integer "defualt_path"
  end

  create_table "specimen", primary_key: "spec_specimen_id", force: :cascade do |t|
    t.bigint "spec_test_order_id", default: 0
    t.string "spec_opd_code"
    t.string "spec_specimen_type"
    t.string "spec_specimen_source", limit: 128
    t.string "spec_specimen_quantity"
    t.string "spec_specimen_expiry", limit: 255
    t.string "spec_uom"
    t.string "spec_specimen_vial", limit: 55
    t.bigint "spec_cur_transfer_to", default: 0
    t.text "spec_cur_container_id"
    t.text "spec_cur_container_position"
    t.text "spec_danger_code"
    t.text "spec_sample_dispose_method"
    t.datetime "spec_collected_time"
    t.text "spec_remark"
    t.integer "spec_is_collected", default: 0
    t.integer "spec_is_recieved", default: 0
    t.datetime "spec_recieved_time"
    t.float "spec_collected_lat", default: 0.0
    t.float "spec_collected_long", default: 0.0
    t.integer "spec_process_staus", default: 0
    t.bigint "spec_collector_id", default: 0
    t.string "spec_collector_name"
    t.bigint "spec_reciever_id", default: 0
    t.string "spec_reciever_name"
    t.string "spec_bar_code"
    t.integer "spec_cur_status", default: 0
    t.decimal "spec_is_barcode_btn_clicked", default: "0.0"
    t.decimal "spec_is_current_barcode", default: "0.0"
    t.string "spec_current_analyzer"
    t.string "spec_analyzer_code"
    t.bigint "provider_id", default: 0
    t.string "provider_title"
    t.index ["spec_opd_code"], name: "idx_21177_fk_specimen_opd_idx"
    t.index ["spec_opd_code"], name: "idx_21587_fk_specimen_opd_idx"
    t.index ["spec_test_order_id"], name: "idx_21177_fk_specimen_test_orders_idx"
    t.index ["spec_test_order_id"], name: "idx_21587_fk_specimen_test_orders_idx"
  end

  create_table "specimen_custody", primary_key: "sc_custody_id", force: :cascade do |t|
    t.decimal "sc_specimen_id"
    t.decimal "sc_transfer_from"
    t.decimal "sc_transfer_to"
    t.text "sc_container_id"
    t.text "sc_container_position"
    t.boolean "sc_status", default: false
    t.text "sc_comment"
    t.datetime "sc_transferred_datetime"
    t.datetime "sc_accepted_datetime"
    t.boolean "sc_position_used", default: false
  end

  create_table "specimen_use", force: :cascade do |t|
    t.string "title", limit: 250
    t.string "category", limit: 250
    t.string "value", limit: 250
  end

  create_table "states", force: :cascade do |t|
    t.string "state_name", limit: 255, null: false
    t.boolean "status", null: false
    t.string "country", limit: 255, null: false
    t.string "ct_purchase_uom", limit: 25
  end

  create_table "students", id: false, force: :cascade do |t|
    t.string "name", limit: 300
    t.string "Email", limit: 300
    t.text "address"
    t.bigint "age"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "address"
    t.integer "age"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "test_order_outside", force: :cascade do |t|
    t.bigint "test_order_id", default: 0
    t.bigint "provider_id", default: 0
    t.string "provider_title"
    t.string "patient_name"
    t.string "opd_name"
    t.integer "no_of_test", default: 0
    t.integer "no_of_sample", default: 0
    t.datetime "order_date"
    t.integer "is_sent", default: 0
    t.string "send_by_id"
    t.string "send_by_title"
    t.integer "transfer_to_id", default: 0
    t.string "transfer_to_name"
    t.datetime "transfer_date"
    t.string "to_priority"
    t.integer "send_status", default: 0
    t.bigint "toos_id", default: 0
  end

  create_table "test_orders", primary_key: "to_test_order_id", force: :cascade do |t|
    t.decimal "to_patient_id"
    t.decimal "to_doctor_id"
    t.string "to_opd_code", limit: 4
    t.string "to_prescription_link", limit: 255
    t.string "to_test_order_type", limit: 255
    t.string "to_priority", limit: 31
    t.bigint "to_test_count", default: 0
    t.bigint "to_pending_tests"
    t.text "to_remark"
    t.string "to_authorized_by", limit: 255
    t.decimal "to_authority_id"
    t.datetime "to_authorization_date"
    t.string "to_bill_to_code", limit: 255
    t.boolean "to_is_data_sent", default: false
    t.decimal "to_created_by", default: "0.0"
    t.text "to_test_order_auth_sign"
    t.datetime "to_order_date_time"
    t.bigint "to_age", default: 0
    t.boolean "to_report_printed"
    t.datetime "to_report_print_date"
    t.string "doctor_name"
    t.string "doctor_email"
    t.string "doctor_mobile"
    t.serial "doctor_alter_mobile"
    t.string "doctor_clinic_address"
    t.string "patient_name"
    t.string "patient_mobile"
    t.string "patient_alter_mobile"
    t.string "patient_gender"
    t.string "patient_email"
    t.string "patient_pincode"
    t.string "patient_state"
    t.string "patient_city"
    t.string "patient_address"
    t.string "doctor_notes"
    t.string "container_type"
    t.string "pathology_notes"
    t.string "total_mrp"
    t.string "source_path"
    t.string "destination_path"
    t.string "opd_code"
    t.string "opd_name"
    t.string "pathology_title"
    t.bigint "pathology_id", default: 0
    t.float "path_fee", default: 0.0
    t.float "doctor_fee", default: 0.0
    t.float "total_fee", default: 0.0
    t.integer "tt_path_process", default: 0
    t.integer "to_is_pregnant", default: 0
    t.integer "to_is_cancelled", default: 0
    t.integer "to_report_msg", default: 0
    t.string "reporting_type"
    t.integer "is_final_approved", default: 0
    t.index ["to_opd_code"], name: "idx_21209_fk_test_orders_opd_idx"
    t.index ["to_opd_code"], name: "idx_21619_fk_test_orders_opd_idx"
  end

  create_table "test_pannel", id: false, force: :cascade do |t|
    t.serial "tid", null: false
    t.bigint "test_master_id"
    t.string "test_name"
    t.string "test_common_name"
    t.bigint "provider_id"
    t.string "provider_title"
    t.float "test_mrp"
    t.datetime "created_date"
    t.text "remark"
    t.bigint "test_order_id"
    t.float "path_fee"
    t.float "doctor_fee"
    t.float "total_fee"
    t.bigint "reporting_date"
    t.text "test_pannel"
    t.text "reporting_day", default: "0"
  end

  create_table "test_transactions", id: false, force: :cascade do |t|
    t.decimal "tt_test_transaction_id"
    t.decimal "tt_specimen_id", default: "0.0"
    t.string "tt_test_code", limit: 31
    t.string "tt_instrument_name", limit: 255
    t.string "tt_opd_code", limit: 4
    t.string "tt_barcode_generated", limit: 255
    t.decimal "tt_conducted_by", default: "0.0"
    t.text "tt_result"
    t.text "tt_raw_results"
    t.string "tt_analyzer_unit", limit: 55
    t.text "tt_test_remark"
    t.text "tt_path_remark"
    t.datetime "tt_completed_date_time"
    t.bigint "tt_order_id"
    t.string "tt_feed_result_template", limit: 200
    t.string "tt_print_result_template", limit: 200
    t.text "tt_uploaded_file_name"
    t.string "tt_measurement_unit", limit: 100
    t.string "tt_normal_range", limit: 200
    t.bigint "tt_age", default: 0
    t.text "tt_indication"
    t.text "tt_method"
    t.text "tt_formula"
    t.string "provider_title"
    t.bigint "pannel_id"
    t.string "procedure_name"
    t.string "test_name"
    t.bigint "procedure_id"
    t.text "tt_reagent"
    t.decimal "tt_reagent_code", default: "0.0"
    t.bigint "reagent_id", default: 0
    t.string "reagent_name"
    t.string "specimen_type"
    t.string "specimen_vial"
    t.string "tt_result_type"
    t.string "tt_calculated_on"
    t.integer "tt_update_lock", default: 0
    t.integer "tt_test_status", default: 0
    t.integer "tt_path_status", default: 0
    t.integer "tt_feed_result_on_template", default: 0
    t.integer "tt_test_handler", default: 0
    t.integer "tt_final_status", default: 0
    t.string "analyzer_test_code"
    t.integer "is_out_side", default: 0
    t.bigint "provider_id", default: 0
    t.index ["tt_instrument_name"], name: "idx_21221_fk_lis_test_transactions_lis_analytical_machine_idx"
    t.index ["tt_instrument_name"], name: "idx_21631_fk_lis_test_transactions_lis_analytical_machine_idx"
    t.index ["tt_opd_code"], name: "idx_21221_fk_lis_test_transactions_lis_opd_idx"
    t.index ["tt_opd_code"], name: "idx_21631_fk_lis_test_transactions_lis_opd_idx"
    t.index ["tt_specimen_id"], name: "idx_21221_fk_lis_test_transactions_lis_specimen_idx"
    t.index ["tt_specimen_id"], name: "idx_21631_fk_lis_test_transactions_lis_specimen_idx"
    t.index ["tt_test_transaction_id"], name: "idx_21221_fk_test_transactions_order_tests_idx"
    t.index ["tt_test_transaction_id"], name: "idx_21631_fk_test_transactions_order_tests_idx"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
