class Advent
  attr_reader :input
  def initialize(input)
    @input = input.split("\n")
    @input.map! do |x|
      dir, steps = x.split(' ', 2)
      [dir, steps.to_i]
    end
    @tails = []
  end

  def move?(head, tail)
    x = head[0] - tail[0]
    y = head[1] - tail[1]

    if x.abs <= 1 && y.abs <= 1
      return nil
    end

    [x <=> 0, y <=> 0]
  end

  def record_tail(rope)
    tail = rope.last
    @tails << tail.dup
  end

  def process_command(command, rope)
    dump_state(rope, command)
    command[1].times do
      case command[0]
      when 'U'
        rope[0][1] += 1
      when 'D'
        rope[0][1] -= 1
      when 'L'
        rope[0][0] -= 1
      when 'R'
        rope[0][0] += 1
      end

      0.upto(rope.length - 1).each_cons(2) do |head, tail|
        while dir = move?(rope[head], rope[tail])
          rope[tail][0] += dir[0]
          rope[tail][1] += dir[1]
        end
      end
      record_tail(rope)
    end
    rope
  end

  def process_program(length=2)
    rope = []
    length.times do |i|
      rope << [0, 0]
    end

    record_tail(rope)
    dump_state(rope)
    @input.each do |command|
      rope = process_command(command, rope)
    end
  end

  def dump_state(rope, command=nil)
    return unless ENV['DEBUG']
    puts "== #{command.join(' ')} ==" if command
    dump_grid(rope)
  end

  def dump_tails
    return unless ENV['DEBUG']
    dump_grid(@tails, "#")
  end

  def dump_grid(points, label=nil)
    return unless ENV['DEBUG']
    x_min = points.map { |p| p[0] }.min
    y_min = points.map { |p| p[1] }.min
    x_max = points.map { |p| p[0] }.max
    y_max = points.map { |p| p[1] }.max

    y_span = [y_max - y_min + 1, y_max + 1].max
    x_span = [x_max - x_min + 1, x_max + 1].max

    puts "Span: #{x_span}x#{y_span}y"
    pp points

    x_diff = x_min < 0 ? x_min.abs : 0
    y_diff = y_min < 0 ? y_min.abs : 0
    grid = y_span.times.map do
      Array.new(x_span, '.')
    end

    points.each.with_index do |point, i|
      label ||= case i
      when 0
        "H"
      when points.length - 1
        "T"
      else
        i.to_s
      end
      grid[point[1] + y_diff][point[0] + x_diff] = label
    end

    grid.reverse.each do |row|
      puts row.join
    end
  end

  def result(length=2)
    process_program(length)
    pp @tails
    dump_tails
    @tails.map(&:join).sort.uniq.count
  end
end
