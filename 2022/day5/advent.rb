class Advent
  attr_reader :stack_input, :program_input
  def initialize(input)
    @stack_input, @program_input = input.split("\n\n", 2).map {|x| x.split("\n")}
    @stack_input.pop # Remove the key
  end

  def stacks
    return @stacks if @stacks
    @stacks = Array.new((stack_input[0].length + 1) / 4) do
      Array.new
    end
    stack_input.each do |line|
      @stacks.size.times do |i|
        letter = line[(i * 4) + 1]
        @stacks[i].push(letter) unless letter == " "
      end
    end
    @stacks
  end

  def program
    @program_input.map do |line|
      line.scan(/\d+/).map(&:to_i)
    end
  end

  def result
    @stacks = nil
    program.each do |count, from, to|
      count.times do
        stacks[to - 1].unshift(stacks[from - 1].shift)
      end
    end
    stacks.map {|x| x[0]}.join
  end

  def result_9001
    @stacks = nil
    program.each do |count, from, to|
      stacks[to - 1].unshift(*stacks[from - 1].shift(count))
    end
    stacks.map {|x| x[0]}.join
  end
end
