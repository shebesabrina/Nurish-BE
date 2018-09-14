require 'rails_helper'

RSpec.describe Formula, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:usage) }
  it { should validate_presence_of(:ingredients) }
  # it { should validate_presence_of(:restrictions) }

  it { should have_one(:formula_overview) }
  it { should have_one(:nutritional_content) }
end
