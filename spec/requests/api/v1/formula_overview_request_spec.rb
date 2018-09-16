require 'rails_helper'

describe 'formula_overview dietary needs' do
  xit 'should display all formulas that are gluten free' do
    formula_1 = create(:formula)
    formula_2 = create(:formula)
    formula_3 = create(:formula)
    formula_4 = create(:formula)

    contains_gluten_uppercase = create(:formula_overview, gluten_free: 'N', formula: formula_1)
    contains_gluten_downcase = create(:formula_overview, gluten_free: 'n', formula: formula_2)
    gluten_free_uppercase = create(:formula_overview, gluten_free: 'Y', formula: formula_3)
    gluten_free_downcase = create(:formula_overview, gluten_free: 'y', formula: formula_4)

    get "/api/v1/formula_overviews?gluten_free"

    formula_overview = JSON.parse(response.body)

    expect(response).to be_successful

    expect(formula_overview.count).to eq(1)
    expect(formula_overview.first["gluten_free"]).to_not eq(contains_gluten_downcase)
    expect(formula_overview.first["gluten_free"]).to_not eq(contains_gluten_uppercase)

    expect(formula_overview.first.to_json).to eq(gluten_free_uppercase.to_json)
    expect(formula_overview.first.to_json).to eq(gluten_free_downcase.to_json)
  end
end
