require 'minitest/autorun'
require 'advent'

class AdventTest < Minitest::Test
  INPUT = <<~EOF
  EOF

  def test_example
    assert_equal 12, Advent.new(INPUT).result
  end
end
