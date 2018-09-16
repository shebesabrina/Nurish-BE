FactoryBot.define do
  factory :nutritional_content do
    formula
    calories { "MyString" }
    protein { "MyString" }
    carbohydrate { "MyString" }
    fiber { "MyString" }
    fat { "MyString" }
    sodium { "MyString" }
    potassium { "MyString" }
    serving_size { "MyString" }
  end
end
