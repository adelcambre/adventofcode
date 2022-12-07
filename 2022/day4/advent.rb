class Advent
  attr_reader :input
  def initialize(input)
    @input = input.split("\n")
  end

  def ranges
    input.map do |line|
      line.split(",").map do |group|
        Range.new(*group.split("-").map(&:to_i))
      end
    end
  end

  def result
    ranges.inject(0) do |sum, (a,b)|
      if a.cover?(b) or b.cover?(a)
        sum += 1
      else
        sum
      end
    end
  end

  def overlaps
    ranges.inject(0) do |sum, (a,b)|
      a = a.to_a
      b = b.to_a

      if a.intersection(b).empty?
        sum
      else
        sum += 1
      end
    end
  end
end
