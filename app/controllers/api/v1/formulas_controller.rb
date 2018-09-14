class Api::V1::FormulasController < ApplicationController

  def index
    if params["allergens"]
      allergens = params["allergens"].split(",")
      formula  = eval Formula.accumulator(allergens)
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
