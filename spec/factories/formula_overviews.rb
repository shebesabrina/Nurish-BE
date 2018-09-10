FactoryBot.define do
  factory :formula_overview do
    sequence(:caloric_dencity) { |n| "formula #{n}" }
    sequence(:allergens) { |n| "soy #{n}" }
  end
end
