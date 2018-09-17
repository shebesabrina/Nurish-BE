class Formula < ApplicationRecord
  validates_presence_of(:title)
  validates_presence_of(:description)
  validates_presence_of(:usage)
  validates_presence_of(:ingredients)
  # validates_presence_of(:restrictions)

  has_one :formula_overview
  has_one :nutritional_content

  def self.allergen_search(allergen, formula = nil)
    if formula
      formula + ".where('ingredients NOT ILIKE ?', '%#{allergen}%')"
      formula + ".where('restrictions NOT ILIKE ?', '%#{allergen}%')"
    else
      "Formula.where('ingredients NOT ILIKE ?', '%#{allergen}%').where('restrictions NOT ILIKE ?', '%#{allergen}%')"
    end
  end

  def self.accumulator(allergens)
    allergens.reduce(nil) do |accum, allergen|
      Formula.allergen_search(allergen, accum)
    end
  end

  # def self.type_search(type)
  #   "Formula.where('usage ILIKE ?', '%#{type}%')"
  # end

end
