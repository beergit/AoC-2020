Year = 2020

class Advent1
  attr_reader (:coin_product) 
  def initialize(input, summands)
    coins = input.each_line.map(&:to_i)
    @coin_product = coins.combination(summands).find{|c| c.reduce(:+) == Year}.reduce(:*)
  end
end

