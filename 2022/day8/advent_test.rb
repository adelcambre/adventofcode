require 'minitest/autorun'
require 'advent'

class AdventTest < Minitest::Test
  INPUT = <<~EOF
30373
25512
65332
33549
35390
  EOF

  def test_example
    assert_equal 21, Advent.new(INPUT).result
  end

  def test_scenic_score
    assert_equal 4, Advent.new(INPUT).scenic_score(2,1)
    assert_equal 8, Advent.new(INPUT).scenic_score(2,3)
    assert_equal 8, Advent.new(INPUT).best_score
  end
end
