class NutritionalContent < ApplicationRecord
  serialize :properties, JSON
  # validates_presence_of(:calories)
  # validates_presence_of(:protein)
  # validates_presence_of(:carbohydrate)
  # validates_presence_of(:fiber)
  # validates_presence_of(:fat)
  # validates_presence_of(:sugar)
  # validates_presence_of(:sodium)
  # validates_presence_of(:potassium)

  belongs_to :formula
end
