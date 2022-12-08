class Advent
  FS_SIZE = 70000000

  attr_reader :input
  def initialize(input)
    @input = input.split("\n")
  end

  class Directory < Hash
    attr_accessor :name

    def total_size
      self.values.map do |v|
        v.is_a?(Directory) ? v.total_size : v
      end.sum
    end

    def inspect
      "Directory<#{name}: #{contents_inspect}>"
    end

    def contents_inspect
      self.map do |k,v|
        v.is_a?(Directory) ? "#{k}/" : k
      end.join(', ')
    end

    def pretty_print(pp)
      pp.pp self.inspect
    end

    def directories
      [self] + values.select { |v| v.is_a? Directory }.map(&:directories).flatten
    end
  end

  def infinite_hash(name="/")
    Directory.new { |h, k| h[k] = Directory.new(&h.default_proc) }.tap do |dir|
      dir.name = name
    end
  end

  def directory_tree
    return @directory_tree if defined?(@directory_tree)
    @directory_tree = infinite_hash
    wd = []
    current_directory = [@directory_tree]

    @input.shift
    @input.each do |line|
      line = line.strip
      if line == "$ ls"
        next
      elsif line[0] == '$'
        directory = line.split.last
        if directory == '..'
          wd.pop
          current_directory.pop
        else
          wd.push directory
          current_directory.push current_directory.last[directory]
        end
      else
        type, name = line.split(' ', 2)

        if type == 'dir'
          current_directory.last[name] = infinite_hash(name)
        else
          current_directory.last[name] = type.to_i
        end
      end
    end
    @directory_tree
  end

  def result
    directory_tree.directories.inject(0) do |sum,d|
      size = d.total_size
      if size <= 100000
        sum + size
      else
        sum
      end
    end
  end

  def dir_to_remove(free_space)
    needed = free_space - (FS_SIZE - directory_tree.total_size)
    if needed <= 0
      0
    else
      directory_tree.directories.select {|x| x.total_size > needed }.sort_by(&:total_size).first.total_size
    end
  end
end
