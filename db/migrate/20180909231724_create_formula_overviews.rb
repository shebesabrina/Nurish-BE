class CreateFormulaOverviews < ActiveRecord::Migration[5.2]
  def change
    create_table :formula_overviews do |t|
      t.string :caloric_density
      t.string :protein
      t.string :carbohydrate
      t.string :fat
      t.string :protein_source
      t.string :carbohydrate_source
      t.string :fat_source
      t.string :dietary_fibre
      t.string :fibre_source
      t.string :n6n3_ratio
      t.string :MCT_LCT
      t.string :water_content
      t.string :osmolality
      t.string :kosher
      t.string :gluten_free
      t.string :lactose_free
      t.string :lactose
      t.string :low_residue

      t.timestamps
    end
  end
end
