
records = JSON.parse(File.read('db/formula_overview.json'))
records.each do |record|
  FormulaOverview.create!(record)
end

records = JSON.parse(File.read('db/formulas.json'))
records.each do |record|
  Formula.create!(record)
end

records = JSON.parse(File.read('db/nutritional_content.json'))
records.each do |record|
  NutritionalContent.create!(record)
end
