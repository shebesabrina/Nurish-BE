records = JSON.parse(File.read('db/formulas.json'))
records.each do |record|
  Formula.create!(record)
end

records = JSON.parse(File.read('db/formula_overview.json'))
records.each_with_index do |record, index|
  record[:formula_id] = index + 1
  FormulaOverview.create!(record)
end


records = JSON.parse(File.read('db/new_nutritional_content.json'))
records.each_with_index do |record, index|
  require'pry';binding.pry
  record[:formula_id] = index + 1
  NutritionalContent.create!(record)
end
