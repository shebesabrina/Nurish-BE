class Api::V1::FormulasController < ApplicationController

  def index
    render json: Formula.all
  end

  def index_without_allergens
    binding.pry
    render json: Formula.nutritional_contents.find(params[:allergens])
  end

  def show
    render json: Formula.find(params[:id])
  end

end
