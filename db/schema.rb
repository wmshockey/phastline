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

ActiveRecord::Schema.define(version: 2020_12_26_151425) do

  create_table "commodities", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "commodity_id"
    t.string "commodity_name"
    t.float "temp1"
    t.float "visc1"
    t.float "temp2"
    t.float "visc2"
    t.float "density"
    t.float "density_cf"
    t.float "vapor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "acoef"
    t.float "bcoef"
    t.integer "user_id"
    t.string "visc_unit", limit: 12
    t.string "dens_unit", limit: 12
    t.string "temp_unit", limit: 12
    t.string "pres_unit", limit: 12
  end

  create_table "dras", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.float "start_kmp"
    t.float "end_kmp"
    t.float "dra_percent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "pipeline_id"
  end

  create_table "elevations", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.float "kmp"
    t.float "elevation"
    t.integer "pipeline_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pipeline_id"], name: "index_elevations_on_pipeline_id"
  end

  create_table "headpoints", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "pump_id"
    t.float "flow"
    t.float "head"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pump_id"], name: "index_headpoints_on_pump_id"
  end

  create_table "nominations", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.date "nom_date"
    t.float "period"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "pipeline_id"
    t.float "total_volume"
    t.string "vol_unit", limit: 12
  end

  create_table "pipelines", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "dist_unit", limit: 12
    t.string "diam_unit", limit: 12
    t.string "thick_unit", limit: 12
    t.string "ruff_unit", limit: 12
    t.string "pres_unit", limit: 12
    t.string "elev_unit", limit: 12
    t.string "temp_unit", limit: 12
  end

  create_table "progressbars", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.text "message"
    t.integer "percent"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_progressbars_on_user_id"
  end

  create_table "pumps", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "pump_id"
    t.text "description"
    t.string "flow_units"
    t.string "head_units"
    t.string "pressure_units"
    t.float "minimum_suction"
    t.integer "stages"
    t.float "impeller_diameter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "efficiency_correction_factor"
    t.float "capacity_correction_factor"
    t.float "head_correction_factor"
    t.integer "user_id"
  end

  create_table "results", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "simulation_id"
    t.string "simulation_name"
    t.integer "step"
    t.datetime "timestamp"
    t.float "kmp"
    t.integer "station_id"
    t.string "stat"
    t.float "flow"
    t.float "pumped_volume"
    t.string "upstream_batch"
    t.string "downstream_batch"
    t.float "hold"
    t.float "suct"
    t.float "head"
    t.float "casep"
    t.float "disc"
    t.float "max_disc_pressure"
    t.float "min_pressure_violation"
    t.float "min_pressure_point"
    t.float "max_pressure_violation"
    t.float "max_pressure_point"
    t.float "total_static_loss"
    t.float "total_dynamic_loss"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "station_curve_data"
    t.text "batch_sequence_data"
    t.float "hhp"
    t.float "step_time"
    t.text "linefill"
    t.index ["simulation_id"], name: "index_results_on_simulation_id"
  end

  create_table "segments", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.float "diameter"
    t.float "thickness"
    t.float "roughness"
    t.float "mawp"
    t.integer "pipeline_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "kmp"
    t.index ["pipeline_id"], name: "index_segments_on_pipeline_id"
  end

  create_table "shipments", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "start_location"
    t.string "end_location"
    t.string "shipper"
    t.string "commodity_id"
    t.float "volume"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "nomination_id"
    t.index ["nomination_id"], name: "index_shipments_on_nomination_id"
  end

  create_table "simulations", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.float "max_flowrate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "max_batchsize"
    t.integer "pipeline_id"
    t.integer "schedule_id"
    t.integer "nomination_id"
    t.integer "user_id"
    t.float "max_steptime"
    t.string "flow_unit", limit: 12
    t.string "vol_unit", limit: 12
    t.string "dist_unit", limit: 12
    t.string "pres_unit", limit: 12
    t.string "energy_unit", limit: 12
    t.string "power_unit", limit: 12
    t.string "pmphead_unit", limit: 12
    t.string "pmpflow_unit", limit: 12
    t.string "status"
  end

  create_table "stations", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.float "kmp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "pipeline_id"
    t.index ["pipeline_id"], name: "index_stations_on_pipeline_id"
  end

  create_table "temperatures", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.float "kmp"
    t.float "temperature"
    t.integer "pipeline_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pipeline_id"], name: "index_temperatures_on_pipeline_id"
  end

  create_table "units", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "station_id"
    t.string "pump_id"
    t.integer "unit_row"
    t.integer "unit_column"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["station_id"], name: "index_units_on_station_id"
  end

  create_table "users", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "elevations", "pipelines"
  add_foreign_key "progressbars", "users"
  add_foreign_key "segments", "pipelines"
  add_foreign_key "shipments", "nominations"
  add_foreign_key "stations", "pipelines"
  add_foreign_key "temperatures", "pipelines"
end
