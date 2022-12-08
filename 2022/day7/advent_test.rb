require 'minitest/autorun'
require 'advent'

class AdventTest < Minitest::Test
  INPUT = <<~EOF
$ cd /
$ ls
dir a
14848514 b.txt
8504156 c.dat
dir d
$ cd a
$ ls
dir e
29116 f
2557 g
62596 h.lst
$ cd e
$ ls
584 i
$ cd ..
$ cd ..
$ cd d
$ ls
4060174 j
8033020 d.log
5626152 d.ext
7214296 k
  EOF

  def test_example
    assert_equal 95437, Advent.new(INPUT).result
  end

  def test_dir_to_remove
    assert_equal 24933642, Advent.new(INPUT).dir_to_remove(30000000)
  end
end
