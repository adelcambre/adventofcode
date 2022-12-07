$LOAD_PATH.push File.expand_path(File.dirname(__FILE__))
require 'advent'

advent = Advent.new(ARGF.read)

# Output here
puts "Result: #{advent.result}"
puts "Overlaps: #{advent.overlaps}"

