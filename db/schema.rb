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

ActiveRecord::Schema.define(version: 2018_09_12_015906) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "formula_overviews", force: :cascade do |t|
    t.string "caloric_density"
    t.string "protein"
    t.string "carbohydrate"
    t.string "fat"
    t.string "protein_source"
    t.string "carbohydrate_source"
    t.string "fat_source"
    t.string "sucralose"
    t.string "dietary_fibre"
    t.string "fibre_source"
    t.string "n6n3_ratio"
    t.string "mct_lct"
    t.string "omega_3_fatty_acids"
    t.string "water_content"
    t.string "osmolality"
    t.string "kosher"
    t.string "gluten_free"
    t.string "lactose_free"
    t.string "lactose"
    t.string "low_residue"
    t.bigint "formula_id"
    t.index ["formula_id"], name: "index_formula_overviews_on_formula_id"
  end

  create_table "formulas", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "usage"
    t.text "ingredients"
    t.string "hcpc"
    t.string "restrictions"
  end

  create_table "nutritional_contents", force: :cascade do |t|
    t.string "calories"
    t.string "protein"
    t.string "carbohydrate"
    t.string "fiber"
    t.string "sugar"
    t.string "fat"
    t.string "sodium"
    t.string "potassium"
    t.string "serving_size"
    t.bigint "formula_id"
    t.index ["formula_id"], name: "index_nutritional_contents_on_formula_id"
  end

  add_foreign_key "formula_overviews", "formulas"
  add_foreign_key "nutritional_contents", "formulas"
end
