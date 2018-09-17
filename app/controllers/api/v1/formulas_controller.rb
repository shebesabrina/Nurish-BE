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
    elsif params["gluten_free"]
      gluten = Formula.joins(:formula_overview)
      .where("formula_overviews.gluten_free = 'Y'")
      render json: gluten
    elsif params["mct_lct"]
      if params["mct_lct"] == "low"
      # mct = Formula.joins(:formula_overview)
      # .where('formula_overviews.mct_lct LIKE ?', "20%")
      # .pluck(:title, :mct_lct)
      #LOW
      low = Formula.find_by_sql("SELECT formulas.title, formulas.id FROM formulas
                  INNER JOIN formula_overviews ON formula_overviews.formula_id = formulas.id
                  WHERE (formula_overviews.mct_lct <= '25')")
      render json: low
      elsif params["mct_lct"] == "medium"

      #MEDIUM
      medium = Formula.find_by_sql("SELECT formulas.title, formulas.id FROM formulas
                  INNER JOIN formula_overviews ON formula_overviews.formula_id = formulas.id
                  WHERE (formula_overviews.mct_lct <= '25' AND mct_lct >= '50')")
      render json: medium
      elsif params["mct_lct"] == "high"

      #HIGH
      high = Formula.find_by_sql("SELECT formulas.title, formulas.id FROM formulas
                  INNER JOIN formula_overviews ON formula_overviews.formula_id = formulas.id
                  WHERE (formula_overviews.mct_lct >= '50')")
      render json: high
      else
        render json: Formula.all
      # binding.pry
      end
    # elsif params["type"]

    else
      render json: Formula.all
    end
  end

  def show
    render json: Formula.find(params[:id]), :include => [ :formula_overview, :nutritional_content ]
  end

end

# Formula.includes(:nutritional_content)
# Formula.includes(:formula_overview)
# Formula.select(:title).joins(:formula_overview).where("formula_overviews.gluten_free = 'Y'")
# SELECT "formulas"."title" FROM "formulas" INNER JOIN "formula_overviews" ON "formula_overviews"."formula_id" = "formulas"."id" WHERE (formula_overviews.mct_lct <= '25' AND mct_lct >= '50');
# localhost:3000/api/v1/formulas?mct_lct=low&whatever=blah,foo,bar
