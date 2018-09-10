FactoryBot.define do
  factory :formula do
    sequence(:title) { |n| "formula title #{n}" }
    sequence(:description) { |n| "formula this formula contains #{n}" }
    sequence(:usage) { |n| "bowel function #{n}" }
    sequence(:ingredients) { |n| "WATER, CORN SYRUP, SOY PROTEIN ISOLATE #{n}" }
    sequence(:hcpc) { |n| "B415#{n}" }
    sequence(:restrictions) { |n| "CONTAINS SOY AND MILK. #{n}" }
  end
end
