class FormulaOverview < ApplicationRecord
  validates_presence_of(:caloric_density)
  validates_presence_of(:protein)
  validates_presence_of(:carbohydrate)
  validates_presence_of(:fat)
  validates_presence_of(:dietary_fibre)
  validates_presence_of(:kosher)
  validates_presence_of(:gluten_free)
  validates_presence_of(:lactose_free)

  belongs_to :formula
end
