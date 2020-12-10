class Advent10
  def initialize(input)
    @jolts = [0] + input.each_line.map(&:to_i)
    @jolts << @jolts.max + 3
    @jolts.sort!
  end

  def part1
    prev = 0
    diffs = [0]*4
    js = @jolts.dup
    until js.empty?
      nx = js.shift
      diffs[nx - prev] += 1
      prev = nx
    end  
    diffs[1]*diffs[3]
  end  

  def part2
    jt = @jolts.reverse
    ranges = {jt[0] => 1, jt[1] => 1}
    ranges[jt[2]] = jt[0..1].select{|jo| jo - jt[2] <= 3}.size
    jt[3..].each_index do |idx|
      ranges[jt[idx + 3]] = jt[idx, 3].select{|jo| jo - jt[idx + 3] <= 3}.inject(0){|s, r| s += ranges[r]}
    end 
    ranges[0] 
  end
end
    
