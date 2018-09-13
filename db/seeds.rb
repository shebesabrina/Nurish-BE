
records = JSON.parse(File.read('db/formula_overview.json'))
records.each do |record, index|
  FormulaOverview.create!(record, formula_id: index + 1)
end

records = JSON.parse(File.read('db/formulas.json'))
records.each do |record|
  Formula.create!(record)
end

records = JSON.parse(File.read('db/nutritional_content.json'))
records.each_with_index do |record, index|
  NutritionalContent.create!(record, formula_id: index + 1)
end
