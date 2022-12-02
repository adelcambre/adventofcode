require 'pp'

class Calories
  attr_reader :elves, :input

  def initialize(input)
    @input = input.split("\n")
    @elves = []
  end

  def self.process(input)
    new(input).tap do |calories|
      calories.process
    end
  end

  def max_calories
    elves[0]
  end

  def top3
    elves[0] + elves[1] + elves[2]
  end

  def process
    calories = 0
    input.each do |line|
      if line.empty?
        elves << calories
        calories = 0
        next
      end

      calories += line.to_i
    end
    elves << calories
    @elves = elves.sort.reverse
  end
end
