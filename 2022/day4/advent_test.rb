require 'minitest/autorun'
require 'advent'

class AdventTest < Minitest::Test
  INPUT = <<~EOF
2-4,6-8
2-3,4-5
5-7,7-9
2-8,3-7
6-6,4-6
2-6,4-8
  EOF

  def test_example
    assert_equal 2, Advent.new(INPUT).result
  end

  def test_overlaps
    assert_equal 4, Advent.new(INPUT).overlaps
  end
end
