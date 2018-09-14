require 'rails_helper'

RSpec.describe NutritionalContent, type: :model do
  # it { should validate_presence_of(:calories) }
  # it { should validate_presence_of(:protein) }
  # it { should validate_presence_of(:carbohydrate) }
  # it { should validate_presence_of(:fiber) }
  # it { should validate_presence_of(:fat) }
  # it { should validate_presence_of(:sugar) }
  # it { should validate_presence_of(:sodium) }
  # it { should validate_presence_of(:potassium) }
  #
  it { should belong_to(:formula) }
end
