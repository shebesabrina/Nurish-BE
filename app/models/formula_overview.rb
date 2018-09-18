class FormulaOverview < ApplicationRecord
  validates_presence_of(:caloric_density)
  validates_presence_of(:protein)
  validates_presence_of(:carbohydrate)
  validates_presence_of(:fat)
  # validates_presence_of(:dietary_fibre)
  validates_presence_of(:kosher)
  validates_presence_of(:gluten_free)
  # validates_presence_of(:lactose_free)

  belongs_to :formula

  def self.search(key_word)
    gluten = key_word.include?('gluten') && key_word.include?('free') ? 'Y' : 'N'
    # lactose_free = key_word.include?('lactose') && key_word.include?('free') ? 'Y' : 'N'
    # kosher = key_word.include?('kosher') ? 'Y' : 'N'

    formula_overviews = FormulaOverview.where("caloric_density ILIKE ?", "%#{key_word}%")
           .or(FormulaOverview.where("protein ILIKE ?", "%#{key_word}%"))
           .or(FormulaOverview.where("carbohydrate ILIKE ?", "%#{key_word}%"))
           .or(FormulaOverview.where("fat ILIKE ?", "%#{key_word}%"))
           .or(FormulaOverview.where("protein_source ILIKE ?", "%#{key_word}%"))
           .or(FormulaOverview.where("carbohydrate_source ILIKE ?", "%#{key_word}%"))
           .or(FormulaOverview.where("fat_source ILIKE ?", "%#{key_word}%"))
           .or(FormulaOverview.where("sucralose ILIKE ?", "%#{key_word}%"))
           .or(FormulaOverview.where("dietary_fibre ILIKE ?", "%#{key_word}%"))
           .or(FormulaOverview.where("fibre_source ILIKE ?", "%#{key_word}%"))
           .or(FormulaOverview.where("n6n3_ratio ILIKE ?", "%#{key_word}%"))
           .or(FormulaOverview.where("mct_lct ILIKE ?", "%#{key_word}%"))
           .or(FormulaOverview.where("omega_3_fatty_acids ILIKE ?", "%#{key_word}%"))
           .or(FormulaOverview.where("water_content ILIKE ?", "%#{key_word}%"))
           .or(FormulaOverview.where("osmolality ILIKE ?", "%#{key_word}%"))
           .or(FormulaOverview.where("lactose ILIKE ?", "%#{key_word}%"))
           .or(FormulaOverview.where("low_residue ILIKE ?", "%#{key_word}%"))
           .or(FormulaOverview.where(gluten_free: gluten))
           # .or(FormulaOverview.where(lactose_free: lactose_free))
           # .or(FormulaOverview.where(kosher: kosher))
    formula_overviews.map { |fo| fo.formula }
  end
end
