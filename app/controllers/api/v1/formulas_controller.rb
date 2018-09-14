class Api::V1::FormulasController < ApplicationController

  def index
    if params["allergens"]

      allergens = params["allergens"].split(",")
      formula_search = allergens.reduce(nil) do |accum, allergen|
        Formula.allergen_search(allergen, accum)
      end
      formula  = eval formula_search
      render json: formula
    else
      render json: Formula.all
    end
  end

  def show
    render json: Formula.find(params[:id])
  end

end
# pp
