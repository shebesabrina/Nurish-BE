class FormulaOverviewSerializer < ActiveModel::Serializer
  attributes :id,
             :caloric_density,
             :protein,
             :carbohydrate,
             :fat,
             :protein_source,
             :carbohydrate_source,
             :fat_source,
             :sucralose,
             :dietary_fibre,
             :fibre_source,
             :n6n3_ratio,
             :mct_lct,
             :omega_3_fatty_acids,
             :water_content,
             :osmolality,
             :kosher,
             :gluten_free,
             :lactose_free,
             :lactose,
             :low_residue
             
  belongs_to :formula
end
