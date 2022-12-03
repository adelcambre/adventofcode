class Advent
  attr_reader :input
  def initialize(input)
    @input = input.split("\n").map do |line|
      line.scan /\w/
    end

  end

  def result
    input.inject(0) do |acc, items|
      size = (items.length / 2).floor
      a = items.slice(0,size)
      b = items.slice(size, size)
      common = a.intersection(b)[0]

      acc + letter_to_number(common)
    end
  end

  def badges
    input.each_slice(3).inject(0) do |acc, (a,b,c)|
      common = a.intersection(b,c)[0]
      acc + letter_to_number(common)
    end
  end

  def letter_to_number(input)
    ascii = input.bytes[0]
    case ascii
    when 65..90
      ascii - 38
    when 97..122
      ascii - 96
    else
      0
    end
  end
end
