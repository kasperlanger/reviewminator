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

ActiveRecord::Schema.define(version: 2020_05_03_095728) do

  create_table "materials", force: :cascade do |t|
    t.string "url", null: false
    t.integer "state", null: false
    t.datetime "recall_after"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["url"], name: "index_materials_on_url", unique: true
  end

  create_table "recalls", force: :cascade do |t|
    t.integer "material_id", null: false
    t.integer "previous_recall_id"
    t.datetime "started_at"
    t.datetime "material_shown_at"
    t.datetime "finished_at"
    t.float "recall_coverage"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["material_id"], name: "index_recalls_on_material_id"
    t.index ["previous_recall_id"], name: "index_recalls_on_previous_recall_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "material_id", null: false
    t.datetime "finished_at"
    t.integer "cause_of_review"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["material_id"], name: "index_reviews_on_material_id"
  end

  add_foreign_key "recalls", "materials"
  add_foreign_key "reviews", "materials"
end
