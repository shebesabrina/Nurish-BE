class FormulaSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :usage, :ingredients, :hcpc, :restrictions

  has_one :formula_overview
  has_one :nutritional_content

  def serializable_hash(adapter_options = nil, options = {}, adapter_instance = self.class.serialization_adapter_instance)
    hash = super
    hash.each { |key, value| hash.delete(key) if value == "null" }
    hash
  end

end
