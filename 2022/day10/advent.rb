class Advent
  attr_reader :input
  def initialize(input)
    @input = input.split("\n")
    @register = 1
    @result = 0
  end

  def run
    @adding = false
    instruction = ""
    cycle = 0
    next_cycle = 40
    until @input.empty?
      cycle += 1
      draw_sprite(cycle, @register)
      if cycle == next_cycle
        next_cycle += 40
        @result += @register * cycle
        print "\n"
      end

      if @adding
        @adding = false
      else
        instruction, value = @input.shift.split(" ", 2)
        @adding = true if instruction == "addx"
        next
      end

      # We're adding here.
      @register += value.to_i
    end
  end

  def draw_sprite(cycle, register)
    range = (register - 1)..(register + 1)
    if range.include?((cycle % 40) - 1)
      print "#"
    else
      print "."
    end
  end

  def result
    run
    @result
  end
end
