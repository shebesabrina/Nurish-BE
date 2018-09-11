# require 'json'
# require_relative 'formula_overview'
require 'pry'

records = JSON.parse(File.read('db/formula_overview.json'))
records.each do |record|
  # binding.pry
  FormulaOverview.create!(record)
end


# 1. Load the JSON data from each data file
# 2. Grab first thing
# 3. If that works, keep going.



# require_relative('formula_overview')

# formula_overview.each do |item|
#   id = 1
#   FormulaOverview.create(id: #{id}, )
#   id = id += 1
# end
