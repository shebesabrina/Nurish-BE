class CreateNutritionalContents < ActiveRecord::Migration[5.2]
  def change
    create_table :nutritional_contents do |t|
      t.string :calories
      t.string :protein
      t.string :carbohydrate
      t.string :fiber
      t.string :sugar
      t.string :fat
      t.string :sodium
      t.string :potassium
      t.string :serving_size

      t.timestamps
    end
  end
end
