class AddFormulaIdToFormulaOverview < ActiveRecord::Migration[5.2]
  def change
    add_reference :formula_overviews, :formula, foreign_key: true
  end
end
