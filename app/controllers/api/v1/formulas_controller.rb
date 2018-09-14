class Api::V1::FormulasController < ApplicationController

  def index
    if params["allergens"]
      allergen = Formula.where('ingredients NOT ILIKE ?', "%#{params["allergens"]}%")
      render json: allergen
    else
      render json: Formula.all
    end
  end

  def show
    render json: Formula.find(params[:id])
  end

end
# pp
