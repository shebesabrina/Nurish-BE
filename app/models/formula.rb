class Formula < ApplicationRecord
  validates_presence_of(:title)
  validates_presence_of(:description)
  validates_presence_of(:usage)
  validates_presence_of(:ingredients)
  # validates_presence_of(:restrictions)

  has_one :formula_overview
  has_one :nutritional_content
end
