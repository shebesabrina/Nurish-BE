class Api::V1::SearchController < ApplicationController
  def index
    key_word = params["key_word"]
    formula = Formula.search(key_word)
    formula_overview = FormulaOverview.search(key_word)
    render json: formula + formula_overview
  end
end
