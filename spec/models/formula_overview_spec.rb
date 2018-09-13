require 'rails_helper'

describe FormulaOverview, type: :model do
  context 'validations' do
    it { should validate_presence_of(:caloric_density) }
    it { should validate_presence_of(:protein) }
    it { should validate_presence_of(:carbohydrate) }
    it { should validate_presence_of(:fat) }
    it { should validate_presence_of(:dietary_fibre) }
    it { should validate_presence_of(:kosher) }
    it { should validate_presence_of(:gluten_free) }
    it { should validate_presence_of(:lactose_free) }

    it { should belong_to(:formula) }
  end
end
