require 'minitest/autorun'
require 'calories'

class CaloriesTest < Minitest::Test
  INPUT = <<~EOF
    1000
    2000
    3000

    4000

    5000
    6000

    7000
    8000
    9000

    10000
  EOF
  def test_simple_case
    assert_equal 1234, Calories.process("1234").max_calories
  end

  def test_example
    assert_equal 24000, Calories.process(INPUT).max_calories
  end

  def test_third_biggest_elf
    assert_equal 45000, Calories.process(INPUT).top3
  end
end
