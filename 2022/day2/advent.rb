class Advent
  # A = Rock, B = Paper, C = Scissors
  # X = lose, Y = draw, Z = win
  # Win = 6, Draw = 3, Lose = 0
  # Rock = 1, Paper = 2, Scissors = 3
  KEY = {
    "A X" => 0 + 3,
    "A Y" => 3 + 1,
    "A Z" => 6 + 2,
    "B X" => 0 + 1,
    "B Y" => 3 + 2,
    "B Z" => 6 + 3,
    "C X" => 0 + 2,
    "C Y" => 3 + 3,
    "C Z" => 6 + 1,
  }

  attr_reader :input
  def initialize(input)
    @input = input.split("\n")
  end

  def total_score
    input.inject(0) do |acc, line|
      acc + KEY[line]
    end
  end
end
