require 'json'

class Advent
  attr_reader :result
  def initialize(input)
    @input = input
    @result = input.split("\n\n").each_with_index.inject(0) do |acc, (pair, i)|
      i += 1
      puts "*" * 100
      puts "Processing:\n\n#{pair}\n"
      if check(*convert(pair)) == -1
        puts "+++++ Pair #{i} is correct"
        # puts pair
        acc + i
      else
        puts "----- Pair #{i} is not correct"
        # puts pair
        acc
      end
    end
  end

  def convert(input)
    input.split("\n").map do |x|
      JSON.parse x
    end
  end

  def check(left, right)
    puts "Comparing:\n\t#{left.inspect}\n\t#{right.inspect}"
    case [left, right]
    when [Numeric, Numeric]
      return left <=> right
    when [Array, Numeric]
      return check(left, Array(right))
    when [Numeric, Array]
      return check(Array(left), right)
    when [Array, Array]
      left.zip(right).each do |l,r|
        result = check(l,r)
        if result != 0
          return result
        end
      end
      return check(left.length, right.length)
    else
      0
    end
  end

  def sort
    packets = @input.split("\n").reject(&:empty?)
    packets.map! {|x| JSON.parse x}
    packets.push [[2]]
    packets.push [[6]]
    packets.sort do |a,b|
      check(a,b)
    end
  end

  def decoder_key
    packets = sort
    (packets.index([[2]]) + 1) * (packets.index([[6]]) + 1)
  end
end

class Array
  def ===(other)
    super unless other.is_a?(Array) and other.length == length

    self.each_with_index.all? do |x,i|
      x === other[i]
    end
  end
end
