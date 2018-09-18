class FormulaSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :usage, :ingredients, :hcpc, :restrictions

  has_one :formula_overview
  has_one :nutritional_content

  def restrictions
    object.restrictions if object.restrictions != null
  end

end
