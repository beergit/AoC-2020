class Advent9
  def initialize(input, preamble)
    @numbers = input.each_line.map(&:to_i)
    @preamble = preamble
  end

  def part1
    ret = @numbers[@preamble..].to_enum.with_index.find do |n, idx|
      @numbers[idx ... idx + @preamble].combination(2).none?{|c| c[0] + c[1] == n}
      end
      ret[0]
  end  

  def part2
    invalid_number = part1
    @numbers.each_index do |idx|
      ((idx + 1)...@numbers.size).each do |pos|
        series = @numbers[idx..pos]
        sum = series.sum
        return series.min + series.max if sum == invalid_number
        break if sum > invalid_number
      end  
    end
  end 
end
