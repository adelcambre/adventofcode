$LOAD_PATH.push File.expand_path(File.dirname(__FILE__))
require 'advent'

advent = Advent.new(ARGF.read)

# Output here
puts advent.result
