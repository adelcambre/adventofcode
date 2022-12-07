require 'minitest/autorun'
require 'advent'

class AdventTest < Minitest::Test
  INPUT = <<~EOF
    [D]    
[N] [C]    
[Z] [M] [P]
 1   2   3 

move 1 from 2 to 1
move 3 from 1 to 3
move 2 from 2 to 1
move 1 from 1 to 2
  EOF

  def test_example
    assert_equal "CMZ", Advent.new(INPUT).result
  end

  def test_9001
    assert_equal "MCD", Advent.new(INPUT).result_9001
  end
end
