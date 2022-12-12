$LOAD_PATH.push File.expand_path(File.dirname(__FILE__))
require 'advent'

input = ARGF.read
advent = Advent.new(input)

# Output here
puts "Result: #{advent.result}"
result = Advent.new(input, 1).result(10000)
puts "Part 2: #{result}"
