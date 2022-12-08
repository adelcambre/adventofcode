class Advent
  attr_reader :grid
  def initialize(input)
    @grid = input.split("\n").map do |row|
      row.strip.chars.map(&:to_i)
    end
    @width = @grid.first.size
    @height = @grid.size
  end

  def visible(x,y)
    if x == 0 or y == 0 or x == (@width - 1) or y == (@height  - 1)
      return true
    end

    # Visible from top
    tallest = (y-1).downto(0).inject(0) do |max,i|
      value = grid[i][x]
      value > max ? value : max
    end
    if tallest < grid[y][x]
      return true
    end

    # Visible from bottom
    tallest = (y+1).upto(@height - 1).inject(0) do |max,i|
      value = grid[i][x]
      value > max ? value : max
    end
    if tallest < grid[y][x]
      return true
    end

    # Visible from left
    tallest = (x-1).downto(0).inject(0) do |max,i|
      value = grid[y][i]
      value > max ? value : max
    end
    if tallest < grid[y][x]
      return true
    end

    # Visible from right
    tallest = (x+1).upto(@width - 1).inject(0) do |max,i|
      value = grid[y][i]
      value > max ? value : max
    end
    if tallest < grid[y][x]
      return true
    end

    return false
  end

  def scenic_score(x,y)
    if x == 0 or y == 0 or x == (@width - 1) or y == (@height  - 1)
      return 0
    end

    score = 1

    # Visible from top
    score *= (y-1).downto(0).inject(0) do |max,i|
      max += 1
      break max if grid[i][x] >= grid[y][x]
      max
    end

    # Visible from bottom
    score *= (y+1).upto(@height - 1).inject(0) do |max,i|
      max += 1
      break max if grid[i][x] >= grid[y][x]
      max
    end

    # Visible from left
    score *= (x-1).downto(0).inject(0) do |max,i|
      max += 1
      break max if grid[y][i] >= grid[y][x]
      max
    end

    # Visible from right
    score *= (x+1).upto(@width - 1).inject(0) do |max,i|
      max += 1
      break max if grid[y][i] >= grid[y][x]
      max
    end

    return score
  end

  def best_score
    @width.times.inject(0) do |x_sum, x|
      best = @height.times.inject(0) do |y_sum, y|
        score = scenic_score(x,y)
        score > y_sum ? score : y_sum
      end
      best > x_sum ? best : x_sum
    end
  end

  def result
    @width.times.inject(0) do |x_sum, x|
      @height.times.inject(0) do |y_sum, y|
        visible(x,y) ? y_sum + 1 : y_sum
      end + x_sum
    end
  end
end
