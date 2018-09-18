class ChangePropertiesOfNutriContent < ActiveRecord::Migration[5.2]
  def change
    remove_column :nutritional_contents, :calories
    remove_column :nutritional_contents, :protein
    remove_column :nutritional_contents, :carbohydrate
    remove_column :nutritional_contents, :fiber
    remove_column :nutritional_contents, :sugar
    remove_column :nutritional_contents, :fat
    remove_column :nutritional_contents, :sodium
    remove_column :nutritional_contents, :potassium
    remove_column :nutritional_contents, :serving_size

    add_column :nutritional_contents, :properties, :text
  end
end
