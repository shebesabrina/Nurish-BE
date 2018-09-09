class CreateFormulaOverviews < ActiveRecord::Migration[5.2]
  def change
    create_table :formula_overviews do |t|
      t.text :calorie_density
      t.text :allergens

      t.timestamps
    end
  end
end
