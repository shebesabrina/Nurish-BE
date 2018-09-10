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
end
