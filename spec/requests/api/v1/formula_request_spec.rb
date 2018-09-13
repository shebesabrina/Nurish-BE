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

    # get "/api/v1/formulas?allergens=#{corn_starch}"
    # get "/api/v1/formulas?p=ingredients:#{corn_starch}"
    get "/api/v1/formulas_allergens/#{corn_starch}"

    formula = JSON.parse(response.body)

    expect(response).to be_successful
    expect(formula["ingredients"]).to_not have_content(corn_starch_upcase)
    expect(formula["ingredients"]).to_not have_content(corn_starch_downcase)
    expect(formula["ingredients"]).to have_content(water)
  end
end
