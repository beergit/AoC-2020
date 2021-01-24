class Advent21
  def initialize(input)
    @receipes  = {}
    input.each_line do |line|
      receipe = line.split '(contains'    
      receipe[0].split.each do |ingedient| 
        @receipes[ingedient.to_sym] ||= []
        (receipe[1][0..-3].split ',').each{|allergen| @receipes[ingedient.to_sym] |= [allergen.strip.to_sym]}
      end
    end
  end

  def part1
  puts
  end  

  def part2
  end
end
    
