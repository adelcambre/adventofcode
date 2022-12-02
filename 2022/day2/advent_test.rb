require 'minitest/autorun'
require 'advent'

class AdventTest < Minitest::Test
  INPUT = <<~EOF
    A Y
    B X
    C Z
  EOF

  def test_example
    assert_equal 12, Advent.new(INPUT).total_score
  end
end
