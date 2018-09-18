class AddImageToFormulas < ActiveRecord::Migration[5.2]
  def change
    add_column :formulas, :image, :string
  end
end
