class Api::V1::FormulasController < ApplicationController

  def index
    if params["allergens"]
      allergens = params["allergens"].split(",")
      formula  = eval Formula.accumulator(allergens)
      render json: formula
    elsif params["hcpc"]
      hcpc = Formula.where('hcpc ILIKE ?', "%#{params["hcpc"]}")
      render json: hcpc
    elsif params["gluten_free"]
      gluten = Formula.joins(:formula_overview)
      .where("formula_overviews.gluten_free = 'Y'")
      render json: gluten
    elsif params["mct_lct"]
      if params["mct_lct"] == "low"
      #LOW
      low = Formula.find_by_sql("SELECT formulas.title, formulas.id, formula_overviews.mct_lct FROM formulas
                  INNER JOIN formula_overviews ON formula_overviews.formula_id = formulas.id
                  WHERE (formula_overviews.mct_lct < '25')")
      render json: low
      elsif params["mct_lct"] == "medium"
      #MEDIUM
      medium = Formula.find_by_sql("SELECT formulas.title, formulas.id, formula_overviews.mct_lct FROM formulas
                  INNER JOIN formula_overviews ON formula_overviews.formula_id = formulas.id
                  WHERE (formula_overviews.mct_lct >= '25' AND formula_overviews.mct_lct < '50')")
      render json: medium
      elsif params["mct_lct"] == "high"

      #HIGH
      high = Formula.find_by_sql("SELECT formulas.title, formulas.id, formula_overviews.mct_lct FROM formulas
                  INNER JOIN formula_overviews ON formula_overviews.formula_id = formulas.id
                  WHERE (formula_overviews.mct_lct >= '50')")
      render json: high
      else
        render json: Formula.all
      end
    elsif params["type"]
      type = params["type"]
      formula  = Formula.where('usage ILIKE ?', "%#{type}%")
      render json: formula
    else
      render json: Formula.all
    end
  end

  def show
    render json: Formula.find(params[:id]), :include => [ :formula_overview, :nutritional_content ]
  end

end
