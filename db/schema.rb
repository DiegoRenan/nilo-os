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

ActiveRecord::Schema.define(version: 2019_03_25_152224) do

  create_table "areas", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "body"
    t.string "picture"
    t.bigint "user_id"
    t.bigint "service_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_id"], name: "index_comments_on_service_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "departments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "responsibles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "service_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_id"], name: "index_responsibles_on_service_id"
    t.index ["user_id"], name: "index_responsibles_on_user_id"
  end

  create_table "roles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sectors", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.bigint "department_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_sectors_on_department_id"
  end

  create_table "service_statuses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "service_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.bigint "department_id"
    t.bigint "sector_id"
    t.bigint "service_status_id"
    t.string "picture"
    t.bigint "user_id"
    t.bigint "service_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_services_on_department_id"
    t.index ["sector_id"], name: "index_services_on_sector_id"
    t.index ["service_status_id"], name: "index_services_on_service_status_id"
    t.index ["service_type_id"], name: "index_services_on_service_type_id"
    t.index ["user_id"], name: "index_services_on_user_id"
  end

  create_table "tool_roles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "tool_id"
    t.bigint "role_id"
    t.boolean "ler", default: false
    t.boolean "criar", default: false
    t.boolean "atualizar", default: false
    t.boolean "deletar", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_tool_roles_on_role_id"
    t.index ["tool_id"], name: "index_tool_roles_on_tool_id"
  end

  create_table "tools", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "controller"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "username"
    t.string "password_digest"
    t.string "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.bigint "department_id"
    t.bigint "sector_id"
    t.bigint "role_id"
    t.index ["department_id"], name: "index_users_on_department_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
    t.index ["sector_id"], name: "index_users_on_sector_id"
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "comments", "services"
  add_foreign_key "comments", "users"
  add_foreign_key "sectors", "departments"
  add_foreign_key "services", "departments"
  add_foreign_key "services", "sectors"
  add_foreign_key "services", "service_statuses"
  add_foreign_key "services", "service_types"
  add_foreign_key "services", "users"
  add_foreign_key "tool_roles", "roles"
  add_foreign_key "tool_roles", "tools"
  add_foreign_key "users", "departments"
  add_foreign_key "users", "roles"
  add_foreign_key "users", "sectors"
end
