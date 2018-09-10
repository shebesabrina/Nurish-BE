class Api::V1::FormulasController < ApplicationController

  def index
    render json: Formula.all
  end



end
