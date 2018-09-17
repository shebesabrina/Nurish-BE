FactoryBot.define do
  factory :formula_overview do
    sequence(:caloric_density) { |n| "formula #{n}" }

    protein "23"
    carbohydrate "34"
    fat "2"
    protein_source "casien"
    carbohydrate_source "potatoes"
    fat_source "olive oil"
    sucralose ""
    dietary_fibre "2"
    fibre_source ""
    n6n3_ratio ""
    mct_lct "25"
    omega_3_fatty_acids ""
    water_content ""
    osmolality ""
    kosher "Y"
    gluten_free "Y"
    lactose_free "N"
    lactose "Y"
    low_residue "Y"
  end
end
