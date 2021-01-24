class Advent21
  def initialize(input)
    receipes  = {}
    @ingredients = []
    @danger_ingredients = {}
    input.each_line do |line|
      receipe = line.split '(contains'    
      ingreds  = receipe[0].split.map(&:strip).map(&:to_sym)
      @ingredients += ingreds
      (receipe[1][0..-3].split(',')).map(&:strip).map(&:to_sym).each do |allergen|
        receipes[allergen] ||= ingreds
        receipes[allergen] &= ingreds
      end
    end
    until receipes.empty?
      receipes.select{|k, v| v.size == 1}.each do |ing|
        @danger_ingredients[ing[0]] = ing[1][0]
        receipes.values.each{|v| v.delete(@danger_ingredients[ing[0]])}
      end
      receipes.delete_if{|k, v| v.empty?}
    end
  end

  def part1
    @ingredients.tally.inject(0){|s, i| s += (@danger_ingredients.values.include?(i[0]) ? 0 : i[1])}
  end  

  def part2
    @danger_ingredients.keys.sort.inject(''){|s, i| s += @danger_ingredients[i].to_s + ','}.chop
  end
end
