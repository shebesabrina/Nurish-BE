class Api::V1::FormulasController < ApplicationController

  def index
    render json: Formula.all
  end

  def show
    render json: Formula.find(params[:id])
  end

end
