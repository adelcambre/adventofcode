require 'minitest/autorun'
require 'advent'

class AdventTest < Minitest::Test
  INPUT = <<~EOF
vJrwpWtwJgWrhcsFMMfFFhFp
jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
PmmdzqPrVvPwwTWBwg
wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
ttgJtRGJQctTZtZT
CrZsJsPPZsGzwwsLwLmpwMDw
  EOF

  def test_example
    assert_equal 157, Advent.new(INPUT).result
  end

  def test_badge
    assert_equal 70, Advent.new(INPUT).badges
  end
end
