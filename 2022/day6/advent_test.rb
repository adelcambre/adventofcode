require 'minitest/autorun'
require 'advent'

class AdventTest < Minitest::Test
  def test_example
    assert_equal 7, Advent.new("mjqjpqmgbljsphdztnvjfqwrcgsmlb").result
    assert_equal 5, Advent.new("bvwbjplbgvbhsrlpgdmjqwftvncz").result
    assert_equal 6, Advent.new("nppdvjthqldpwncqszvftbrmjlhg").result
    assert_equal 10, Advent.new("nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg").result
    assert_equal 11, Advent.new("zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw").result
  end

  def test_start_of_message
    assert_equal 19, Advent.new("mjqjpqmgbljsphdztnvjfqwrcgsmlb").start_of_message
    assert_equal 23, Advent.new("bvwbjplbgvbhsrlpgdmjqwftvncz").start_of_message
    assert_equal 23, Advent.new("nppdvjthqldpwncqszvftbrmjlhg").start_of_message
    assert_equal 29, Advent.new("nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg").start_of_message
    assert_equal 26, Advent.new("zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw").start_of_message
  end
end
