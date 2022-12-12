class Advent
  class Monkey
    attr_reader :items, :operation, :test, :if_true, :if_false, :inspections, :worry_factor
    @@monkeys = {}

    def initialize(number, input, worry_factor=3)
      @@monkeys[number] = self
      @number = number
      @config = input.split("\n").each.with_object({}) do |line, hash|
        k,v = line.split(":")
        hash[k.strip] = v.strip
      end
      @inspections = 0

      @items = @config["Starting items"].split(",").map(&:to_i)
      make_operator(@config["Operation"])
      @test = @config["Test"].split.last.to_i
      @if_true = @config["If true"].split.last.to_i
      @if_false = @config["If false"].split.last.to_i
      @worry_factor = worry_factor
    end

    def lcm
      @@monkeys.inject(1) do |acc, (_, monkey)|
        acc * monkey.test
      end
    end

    def make_operator(op)
      instance_eval <<~RUBY
        def run_operation(old)
          #{op}
          new
        end
      RUBY
    end

    def process_item(item)
      @inspections += 1
      item = calculate_worry(item)
      target = find_target(item)
      throw_to(target, item)
    end

    def calculate_worry(worry)
      worry = run_operation(worry)
      worry.div(worry_factor)
    end

    def find_target(item)
      if item.modulo(test) == 0
        if_true
      else
        if_false
      end
    end

    def throw_to(target, item)
      @@monkeys[target].catch_item(item)
    end

    def catch_item(item)
      items.push(item % lcm)
    end

    def process
      until items.empty?
        process_item(items.shift)
      end
    end
  end

  attr_reader :monkeys
  def initialize(input, worry_factor=3)
    input = input.split("\n\n")
    @monkeys = input.map do |monkey|
      number, config = monkey.split("\n", 2)
      number = number.scan(/\d+/).first.to_i
      Monkey.new(number, config, worry_factor)
    end
  end

  def process_round
    monkeys.each do |monkey|
      monkey.process
    end
  end

  def process_rounds(count = 20)
    puts
    count.times do |i|
      printf("\rProcessing round: % 5d", i)
      process_round
    end
    puts
  end

  def result(rounds=20)
    process_rounds(rounds)
    x, y = monkeys.map(&:inspections).sort.reverse
    x * y
  end
end
