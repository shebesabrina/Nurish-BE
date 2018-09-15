FactoryBot.define do
  factory :formula_overview do
    sequence(:caloric_density) { |n| "formula #{n}" }
    sequence(:allergens) { |n| "soy #{n}" }
  end
end
