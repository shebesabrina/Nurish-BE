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

    get "/api/v1/formulas?allergens=corn"


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
    standard_formula_upcase_1 = create(:formula, hcpc: 'B4150')
    standard_formula_upcase_2 = create(:formula, hcpc: 'B4150')
    standard_formula_upcase_3 = create(:formula, hcpc: 'B4150')
    # standard_formula_downcase = create(:formula, hcpc: 'b4150')
    specialty_formula_upcase = create(:formula, hcpc: 'B4155')
    specialty_formula_downcase = create(:formula, hcpc: 'b4155')
    # invalid = create(:formula, hcpc: 'B4150')

    get "/api/v1/formulas?hcpc=B4150"

    formula = JSON.parse(response.body)

    expect(response).to be_successful
    expect(formula.count).to eq(3)
    expect(formula.first["hcpc"]).to_not eq(specialty_formula_upcase)
    expect(formula.first["hcpc"]).to_not eq(specialty_formula_downcase)

    expect(formula.first.to_json).to eq(standard_formula_upcase_1.to_json)
    expect(formula.second.to_json).to eq(standard_formula_upcase_2.to_json)
    expect(formula.third.to_json).to eq(standard_formula_upcase_3.to_json)
    # expect(formula.first.to_json).to eq(standard_formula_downcase.to_json)
  end

  require 'rails_helper'

  describe 'formula_overview dietary needs' do
    it 'should display all formulas that are gluten free' do
      formula_1 = create(:formula)
      formula_2 = create(:formula)
      formula_3 = create(:formula)
      formula_4 = create(:formula)

      contains_gluten_uppercase = create(:formula_overview, gluten_free: 'N', formula: formula_1)
      # binding.pry
      contains_gluten_downcase = create(:formula_overview, gluten_free: 'n', formula: formula_2)
      gluten_free_uppercase = create(:formula_overview, gluten_free: 'Y', formula: formula_3)
      # gluten_free_downcase = create(:formula_overview, gluten_free: 'y', formula: formula_4)

      get "/api/v1/formulas?gluten_free=Y"

      formula = JSON.parse(response.body)

      expect(response).to be_successful

      expect(formula.count).to eq(1)
      # binding.pry
      expect(formula.first).to_not eq(formula_1)
      expect(formula.first).to_not eq(formula_2)

      expect(formula.first.to_json).to eq(formula_3.to_json)
      # expect(formula.first.formula_overview.to_json).to eq(formula_4.to_json)
    end
  end

  describe 'MCT oil percentage range' do
    it 'should display all formulas with less than 25% MCT oil' do
      formula_1 = create(:formula)
      formula_2 = create(:formula)
      formula_3 = create(:formula)
      # formula_4 = create(:formula)

      low = create(:formula_overview, mct_lct: '20:80', formula: formula_1)
      mid = create(:formula_overview, mct_lct: '50:80', formula: formula_2)
      high = create(:formula_overview, mct_lct: '75:80', formula: formula_3)
      # mct_lct_downcase = create(:formula_overview, mct_lct: 'y', formula: formula_4)

      get "/api/v1/formulas?mct_lct=low"

      formula = JSON.parse(response.body)

      expect(response).to be_successful

      expect(formula.count).to eq(1)
      # binding.pry
      expect(formula.first["title"]).to eq(formula_1.title)
      expect(formula.first).to_not eq(formula_2)

      expect(formula.first.to_json).to_not eq(formula_3.to_json)
      # expect(formula.first.formula_overview.to_json).to eq(formula_4.to_json)
    end
  end
end
