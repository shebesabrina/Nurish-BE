class CreateFormulas < ActiveRecord::Migration[5.2]
  def change
    create_table :formulas do |t|
      t.string :title
      t.text :description
      t.text :usage
      t.text :ingredients
      t.string :hcpc
      t.string :restrictions
    end
  end
end
