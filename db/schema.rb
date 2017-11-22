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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171120012818) do

  create_table "commodities", force: :cascade do |t|
    t.string   "commodity_id",   limit: 255
    t.string   "commodity_name", limit: 255
    t.float    "temp1",          limit: 24
    t.float    "visc1",          limit: 24
    t.float    "temp2",          limit: 24
    t.float    "visc2",          limit: 24
    t.float    "density",        limit: 24
    t.float    "density_cf",     limit: 24
    t.float    "vapor",          limit: 24
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.float    "acoef",          limit: 24
    t.float    "bcoef",          limit: 24
    t.integer  "user_id",        limit: 4
  end

  create_table "dras", force: :cascade do |t|
    t.float    "start_kmp",   limit: 24
    t.float    "end_kmp",     limit: 24
    t.float    "dra_percent", limit: 24
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "pipeline_id", limit: 4
  end

  create_table "elevations", force: :cascade do |t|
    t.float    "kmp",         limit: 24
    t.float    "elevation",   limit: 24
    t.integer  "pipeline_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "elevations", ["pipeline_id"], name: "index_elevations_on_pipeline_id", using: :btree

  create_table "headpoints", force: :cascade do |t|
    t.string   "pump_id",    limit: 255
    t.float    "flow",       limit: 24
    t.float    "head",       limit: 24
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "headpoints", ["pump_id"], name: "index_headpoints_on_pump_id", using: :btree

  create_table "nominations", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.date     "nom_date"
    t.float    "period",      limit: 24
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "pipeline_id", limit: 4
  end

  create_table "pipelines", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "user_id",     limit: 4
  end

  create_table "progressbars", force: :cascade do |t|
    t.string   "message",    limit: 255
    t.integer  "percent",    limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "progressbars", ["user_id"], name: "index_progressbars_on_user_id", using: :btree

  create_table "pumps", force: :cascade do |t|
    t.string   "pump_id",                      limit: 255
    t.text     "description",                  limit: 65535
    t.string   "flow_units",                   limit: 255
    t.string   "head_units",                   limit: 255
    t.string   "pressure_units",               limit: 255
    t.float    "minimum_suction",              limit: 24
    t.integer  "stages",                       limit: 4
    t.float    "impeller_diameter",            limit: 24
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.float    "efficiency_correction_factor", limit: 24
    t.float    "capacity_correction_factor",   limit: 24
    t.float    "head_correction_factor",       limit: 24
    t.integer  "user_id",                      limit: 4
  end

  create_table "results", force: :cascade do |t|
    t.integer  "simulation_id",          limit: 4
    t.string   "simulation_name",        limit: 255
    t.integer  "step",                   limit: 4
    t.datetime "timestamp"
    t.float    "kmp",                    limit: 24
    t.integer  "station_id",             limit: 4
    t.string   "stat",                   limit: 255
    t.float    "flow",                   limit: 24
    t.float    "pumped_volume",          limit: 24
    t.string   "upstream_batch",         limit: 255
    t.string   "downstream_batch",       limit: 255
    t.float    "hold",                   limit: 24
    t.float    "suct",                   limit: 24
    t.float    "head",                   limit: 24
    t.float    "casep",                  limit: 24
    t.float    "disc",                   limit: 24
    t.float    "max_disc_pressure",      limit: 24
    t.float    "min_pressure_violation", limit: 24
    t.float    "min_pressure_point",     limit: 24
    t.float    "max_pressure_violation", limit: 24
    t.float    "max_pressure_point",     limit: 24
    t.float    "total_static_loss",      limit: 24
    t.float    "total_dynamic_loss",     limit: 24
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.text     "station_curve_data",     limit: 65535
    t.text     "batch_sequence_data",    limit: 65535
    t.float    "hhp",                    limit: 24
    t.float    "step_time",              limit: 24
    t.text     "linefill",               limit: 65535
  end

  add_index "results", ["simulation_id"], name: "index_results_on_simulation_id", using: :btree

  create_table "segments", force: :cascade do |t|
    t.float    "diameter",    limit: 24
    t.float    "thickness",   limit: 24
    t.float    "roughness",   limit: 24
    t.float    "mawp",        limit: 24
    t.integer  "pipeline_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.float    "kmp",         limit: 24
  end

  add_index "segments", ["pipeline_id"], name: "index_segments_on_pipeline_id", using: :btree

  create_table "shipments", force: :cascade do |t|
    t.string   "start_location", limit: 255
    t.string   "end_location",   limit: 255
    t.string   "shipper",        limit: 255
    t.string   "commodity_id",   limit: 255
    t.float    "volume",         limit: 24
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "nomination_id",  limit: 4
  end

  add_index "shipments", ["nomination_id"], name: "index_shipments_on_nomination_id", using: :btree

  create_table "simulations", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.string   "description",   limit: 255
    t.float    "max_flowrate",  limit: 24
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.float    "max_batchsize", limit: 24
    t.integer  "pipeline_id",   limit: 4
    t.integer  "schedule_id",   limit: 4
    t.integer  "nomination_id", limit: 4
    t.integer  "user_id",       limit: 4
    t.float    "max_steptime",  limit: 24
  end

  create_table "stations", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.float    "kmp",         limit: 24
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "pipeline_id", limit: 4
  end

  add_index "stations", ["pipeline_id"], name: "index_stations_on_pipeline_id", using: :btree

  create_table "temperatures", force: :cascade do |t|
    t.float    "kmp",         limit: 24
    t.float    "temperature", limit: 24
    t.integer  "pipeline_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "temperatures", ["pipeline_id"], name: "index_temperatures_on_pipeline_id", using: :btree

  create_table "units", force: :cascade do |t|
    t.integer  "station_id",  limit: 4
    t.string   "pump_id",     limit: 255
    t.integer  "unit_row",    limit: 4
    t.integer  "unit_column", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "units", ["station_id"], name: "index_units_on_station_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.boolean  "admin",                              default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "elevations", "pipelines"
  add_foreign_key "progressbars", "users"
  add_foreign_key "segments", "pipelines"
  add_foreign_key "shipments", "nominations"
  add_foreign_key "stations", "pipelines"
  add_foreign_key "temperatures", "pipelines"
end
