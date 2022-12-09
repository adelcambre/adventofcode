require 'minitest/autorun'
require 'advent'

class AdventTest < Minitest::Test
  INPUT = <<~EOF
R 4
U 4
L 3
D 1
R 4
D 1
L 5
R 2
  EOF

  def test_example
    skip
    assert_equal 13, Advent.new(INPUT).result
  end

  def test_longer_rope
    input = <<~EOF
R 5
U 8
L 8
D 3
R 17
D 10
L 25
U 20
    EOF
    assert_equal 36, Advent.new(input).result(10)
  end

  def test_simple_long_rope
    skip
    input = <<~EOF
R 4
U 4
    EOF
    assert_equal 1, Advent.new(input).result(10)
  end
end
