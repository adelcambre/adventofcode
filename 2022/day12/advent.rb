class Advent
  class Point
    @@points = {}
    attr_reader :coords, :letter
    attr_accessor :distance, :parent
    def initialize(letter, coords, distance=Float::INFINITY)
      @letter = letter
      @coords = coords
      @distance = distance
      @@points[coords] = self
      @parent = nil
    end

    def self.dump_points
      @@points.values.each do |p|
        puts p.inspect
      end
    end

    def self.points
      @@points
    end

    def self.find(coords)
      @@points[coords]
    end

    def inspect
      "<Point '#{@letter}, #{@coords.inspect}: #@distance>"
    end

    def path
      if parent
        parent.path + [self]
      else
        [self]
      end
    end
  end

  def initialize(input)
    build_points(input)
    @edges = []
    build_edges
  end

  def build_points(input)
    input.split("\n").each.with_index do |line,i|
      line.chars.each.with_index do |char, j|
        coords = [i,j]

        case char
        when 'S'
          @start = coords
          Point.new('a', coords, 0)
        when 'E'
          @target = coords
          Point.new('z', coords)
        when 'a'
          Point.new('a', coords, 0)
        else
          Point.new(char, coords)
        end
      end
    end
  end

  def build_edges
    Point.points.each do |coords, point|
      neighbors(point).each do |neighbor|
        if neighbor.letter.ord <= point.letter.ord + 1
          @edges.push([point, neighbor])
        end
      end
    end
  end

  def neighbors(point)
    x,y = point.coords
    [Point.points[[x-1,y]],
     Point.points[[x+1,y]],
     Point.points[[x,y-1]],
     Point.points[[x,y+1]]].compact
  end

  def bellman_ford
    (Point.points.size - 1).times do
      @edges.each do |from, to|
        if from.distance + 1 < to.distance
          to.distance = from.distance + 1
          to.parent = from
        end
      end
    end
  end

  def result
    bellman_ford
    target = Point.find(@target)
    target.distance
  end

  def shortest
  end
end
