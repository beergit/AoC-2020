class Advent6
  def initialize(input_file)
    @answers = File.read(input_file).split(/\n{2,}/)
  end

  def part1
    @answers.reduce(0){|s, a| s += a.split.map(&:chars).reduce(:|).uniq.size}
  end

  def part2
    @answers.reduce(0){|s, a| s += a.split.map(&:chars).reduce(:&).size}
  end    
end

