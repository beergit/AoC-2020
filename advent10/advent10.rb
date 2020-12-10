class Advent10
  def initialize(input)
    @jolts = [0] + input.each_line.map(&:to_i)
    @jolts << @jolts.max + 3
    @jolts.sort!
    @sum = 0
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
    arranges = []
    @jolts.each{|j| arranges << [j, @jolts.select{|js| (1..3).include?(js - j)}]}
    ix = arranges.rindex{|k| k[1].size > 1}

    ranges = []
    r_start = arranges[0][0]
    r_end = r_start
    idx = 0
    until idx == arranges.size
      r_start = arranges[idx][0]
      idx += 1 while arranges[idx + 1] and arranges[idx][1].size < 2
      ranges << [(r_start..arranges[idx][0])]
      idx += 1
    end
    arranges.reverse_each do |k|
      if k[1].size > 1
        val = k[1].inject(0) do |s, kx|
          ix = ranges.find{|r| r[0].include? kx} 
          s += ranges[ix][1]
        end
        ranges.find{|r| r.include?(k[0])} << val
      end
    end
    ranges.last[1]
#part4 [46,47, 48, 49, 52]
    part4 [ 32, 33, 34, 35, 38, 39, 42, 45, 46, 47, 48, 49, 52]
  end 

def part4(jo)
    arranges = []
    jo.each{|j| arranges << [j, @jolts.select{|js| (1..3).include?(js - j)}]}
    ix = arranges.rindex{|k| k[1].size > 1}
    ranges = [[arranges[ix + 1][0], 1]]
    arranges.reverse_each do |k|
      if k[1].size > 1
        val = k[1].inject(0) do |s, kx|
          ix = ranges.index{|r| r[0] <= kx}|| ranges.size - 1 
          s += ranges[ix][1]
        end
        ranges << [k[0], val]
      end
    end
    ranges.last[1]
  end 



def foo(arranges, key)
#   puts "{#{key} => [#{arranges[key].join(', ')}]"
     @sum += 1 if key == arranges.keys.last
   arranges[key].each do |k|
     foo(arranges, k)
  end
end
    


def part3(jo)
    @sum = 0
    arranges = {}
    jo.each{|j| arranges[j] = @jolts.select{|js| (1..3).include?(js - j)}}
    foo(arranges, arranges.keys[0])
  @sum
end


end
