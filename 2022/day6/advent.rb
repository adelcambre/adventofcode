class Advent
  attr_reader :input
  def initialize(input)
    @input = input.chars
  end

  def marker(index)
    message = input.dup
    buffer = message.shift(index - 1)
    buffer.unshift("INVALID")

    message.each.with_index do |i, n|
      buffer.shift
      buffer.push(i)
      return n + index if buffer.sort == buffer.sort.uniq
    end
  end

  def result
    marker(4)
  end

  def start_of_message
    marker(14)
  end
end
