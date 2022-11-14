ActiveRecord::Schema[7.0].define(version: 2022_11_14_142248) do
  create_table "spells", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_spells_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wizards", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.string "house"
    t.string "bio"
    t.date "birthday"
    t.boolean "relatives"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
