class Api::V1::FormulasController < ApplicationController

  def index
    # binding.pry
    if params["allergens"]
      allergens = params["allergens"].split(",")
      formula  = eval Formula.accumulator(allergens)
      render json: formula
    elsif params["hcpc"]
      # hcpc = Formula.where(hcpc: params["hcpc"])
      hcpc = Formula.where('hcpc LIKE ?', "%#{params["hcpc"]}")
      render json: hcpc
    elsif params["gluten_free"]
      Formula.includes(:nutritional_content).where(gluten_free = "Y")
      # Formula.where(gluten_free = "Y", :include => [ :formula_overview ])
    else
      render json: Formula.all
    end
  end

  def show
    render json: Formula.find(params[:id]), :include => [ :formula_overview, :nutritional_content ]
    # Formula.includes(:nutritional_content && :formula_overview).first
  end

end

# Formula.includes(:nutritional_content)
# Formula.includes(:formula_overview)
