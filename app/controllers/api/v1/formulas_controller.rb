class Api::V1::FormulasController < ApplicationController

  def index
    if params["allergens"]
      allergens = params["allergens"].split(",")
      formula  = eval Formula.accumulator(allergens)
      render json: formula
    elsif params["hcpc"]
      # hcpc = Formula.where(hcpc: params["hcpc"])
      hcpc = Formula.where('hcpc LIKE ?', "%#{params["hcpc"]}")
      render json: hcpc
    else
      render json: Formula.all
    end
  end

  def show
    render json: Formula.find(params[:id])
    # Formula.includes(:nutritional_content && :formula_overview).first
  end

end

# Formula.includes(:nutritional_content)
# Formula.includes(:formula_overview)
