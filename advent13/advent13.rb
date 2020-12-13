class Advent13
  def initialize(input)
    lines = input.split
    @time = lines[0].to_i 
    @schedule = lines[1].split ','
  end

  def part1
    s = @schedule.map{|sd| sd.to_i unless sd == 'x'}.compact
    min_time = s.map(&:to_i).min{|a, b| @time - (@time%a) + a <=> @time - (@time%b) + b}
    ((@time/min_time + 1)*min_time - @time)*min_time
  end

  def part2
    s = @schedule.map{|sd| sd.to_i unless sd == 'x'}.compact.sort.reverse
    start = step = 1
    until s.empty?
      sx = s.shift
      p = start.step(Float::INFINITY, step).lazy.find do |idx|
        s_idx =@schedule.index(sx.to_s)
        idx%sx == ((s_idx == 0 or s_idx == sx) ? 0 : sx - (s_idx%sx))
      end
      start = p
      step *= sx
    end
    start.to_i
  end

end
