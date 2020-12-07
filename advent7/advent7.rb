class Advent7
  def initialize(input_file)
    @bags =  {}
    File.readlines(input_file, chomp: true).map{|line| line.split 'contain'}.map do |rule|
      k = rule[0].split
      key = [k[0], k[1]].map(&:to_sym)
      value = []
      rule[1].split(',').each do |r| 
        unless r == ' no other bags.' 
          v = r.split
          value << {:bag => [v[1], v[2]].map(&:to_sym), :amount => v[0].to_i}
        end
      end
      @bags[key] = value
    end
  end

  def part1
    @bags.keys.count{|bag| bag_include?(bag, [:shiny, :gold])}
  end

  def part2
    bag_count([:shiny, :gold]) - 1
  end

  private

    def bag_include?(bag, look)
      @bags[bag].any?{|v| v[:bag] == look or bag_include?(v[:bag], look)}
    end  
    
    def bag_count(look)
      @bags[look].empty? ? 1 : @bags[look].inject(0){|s, b| s += b[:amount]*bag_count(b[:bag])} + 1
    end  

end

