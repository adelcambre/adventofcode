require 'minitest/autorun'
require 'advent'

class AdventTest < Minitest::Test
  INPUT = <<~EOF
    Sabqponm
    abcryxxl
    accszExk
    acctuvwj
    abdefghi
  EOF

  def test_example
    assert_equal 31, Advent.new(INPUT).result
  end
end
