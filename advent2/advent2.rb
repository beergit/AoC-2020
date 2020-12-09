class Advent2
  def initialize(input)
    @policities = input.each_line.map{|line| Policity.new(line)}
  end

  def part1
    @policities.count{|pol| pol.valid_part1?}
  end  

  def part2
    @policities.count{|pol| pol.valid_part2?}
  end 

private
  class Policity
    def initialize(line)
      pm = /(\d+)-(\d+)\s+([a-z]):\s+([a-z]+)/.match(line)
      @pol_range, @pol_char, @pol_passwd = (pm[1].to_i..pm[2].to_i), pm[3], pm[4]
    end

    def valid_part1?
      @pol_range.include? @pol_passwd.count(@pol_char)
    end

    def valid_part2?
      (@pol_passwd[@pol_range.first - 1] == @pol_char) ^ (@pol_passwd[@pol_range.last - 1] == @pol_char)
    end
  end
end

