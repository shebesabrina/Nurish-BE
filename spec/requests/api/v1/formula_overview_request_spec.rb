require 'rails_helper'

describe 'formula_overview dietary needs' do
  xit 'should display all formulas that are gluten free' do
    contains_gluten_uppercase = create(:formula_overview, gluten_free: 'N')
    contains_gluten_downcase= create(:formula_overview, gluten_free: 'N')
    gluten_free_uppercase = create(:formula_overview, gluten_free: 'Y')
    gluten_free_downcase = create(:formula_overview, gluten_free: 'y')

    get "/api/v1/formula_overviews?gluten_free"

    formula_overview = JSON.parse(response.body)

    expect(response).to be_successful
    # binding.pry
    expect(formula_overview.count).to eq(1)
    expect(formula_overview.first["gluten_free"]).to_not eq(contains_gluten_downcase)
    expect(formula_overview.first["gluten_free"]).to_not eq(contains_gluten_uppercase)

    expect(formula_overview.first.to_json).to eq(gluten_free_uppercase.to_json)
    expect(formula_overview.first.to_json).to eq(gluten_free_downcase.to_json)
  end
end
