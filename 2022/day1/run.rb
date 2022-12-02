$LOAD_PATH.push File.expand_path(File.dirname(__FILE__))
require 'calories'

calories = Calories.process(ARGF.read)

puts "Max: #{calories.max_calories}"
puts "Top 3: #{calories.top3}"
