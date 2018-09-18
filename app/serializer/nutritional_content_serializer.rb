class NutritionalContentSerializer < ActiveModel::Serializer
  attributes :calories,
             :protein,
             :carbohydrate,
             :fiber,
             :sugar,
             :fat,
             :sodium,
             :potassium

  belongs_to :formula
end
