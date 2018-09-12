class CreateNutritionalContents < ActiveRecord::Migration[5.2]
  def change
    create_table :nutritional_contents do |t|
      t.string :calories
      t.string :protein
      t.string :carbohydrates
      t.string :fiber
      t.string :fat
      t.string :sodium
      t.string :potassium
      t.string :service_size

      t.timestamps
    end
  end
end
