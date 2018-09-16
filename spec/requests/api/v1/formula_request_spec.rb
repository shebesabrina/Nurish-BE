require 'rails_helper'

describe 'Formula API' do
  it 'sends a list of formulas' do

    create_list(:formula, 3)

    get '/api/v1/formulas'

    expect(response).to be_successful

    formulas = JSON.parse(response.body)
    expect(formulas.count).to eq(3)
  end

  it 'can get one formula by its id' do
    id = create(:formula).id

    get "/api/v1/formulas/#{id}"

    formula = JSON.parse(response.body)

    expect(response).to be_successful
    expect(formula["id"]).to eq(id)
  end

  it 'can get formulas that do not contain specific ingredients' do
    corn_starch_upcase = create(:formula, ingredients: 'CORN STARCH')
    corn_starch_downcase = create(:formula, ingredients: 'corn starch')
    water = create(:formula, ingredients: 'WATER')

    # get "/api/v1/formulas?allergens=#{corn_starch_upcase}"
    # binding.pry
    get "/api/v1/formulas?allergens=corn"
    # get "/api/v1/formulas_allergens/#{corn_starch_upcase}"

    formula = JSON.parse(response.body)

    expect(response).to be_successful
    expect(formula.count).to eq(1)
    expect(formula.first["ingredients"]).to_not eq(corn_starch_upcase)
    expect(formula.first["ingredients"]).to_not eq(corn_starch_downcase)
    expect(formula.first.to_json).to eq(water.to_json)
  end

  it 'can get formulas that do not contain multiple ingredient allergens' do
    corn_starch_upcase = create(:formula, ingredients: 'CORN STARCH')
    corn_starch_downcase = create(:formula, ingredients: 'corn starch')
    milk_upcase = create(:formula, ingredients: 'MILK')
    milk_downcase = create(:formula, ingredients: 'milk')
    water = create(:formula, ingredients: 'WATER')

    get "/api/v1/formulas?allergens=corn,milk"

    formula = JSON.parse(response.body)

    expect(response).to be_successful
    expect(formula.count).to eq(1)
    expect(formula.first["ingredients"]).to_not eq(corn_starch_upcase)
    expect(formula.first["ingredients"]).to_not eq(corn_starch_downcase)
    expect(formula.first["ingredients"]).to_not eq(milk_downcase)
    expect(formula.first["ingredients"]).to_not eq(milk_upcase)
    expect(formula.first.to_json).to eq(water.to_json)
  end

  it 'can get formulas that have a standard hcpc code of B4150' do
    standard_formula_upcase = create(:formula, hcpc: 'B4150')
    standard_formula_downcase = create(:formula, hcpc: 'b4150')
    specialty_formula_upcase = create(:formula, hcpc: 'B4155')
    specialty_formula_downcase = create(:formula, hcpc: 'b4155')
    # invalid = create(:formula, hcpc: 'B4150')

    get "/api/v1/formulas?hcpc=B4150"

    formula = JSON.parse(response.body)

    expect(response).to be_successful
    expect(formula.count).to eq(1)
    expect(formula.first["hcpc"]).to_not eq(specialty_formula_upcase)
    expect(formula.first["hcpc"]).to_not eq(specialty_formula_downcase)

    expect(formula.first.to_json).to eq(standard_formula_upcase.to_json)
    expect(formula.first.to_json).to eq(standard_formula_downcase.to_json)
  end
end
