Year = 2020

class Advent1
  attr_reader (:coin_product) 
  def initialize(input_file, summands)
    coins = File.new(input_file).readlines.map(&:to_i)
    @coin_product = coins.combination(summands).find{|c| c.reduce(:+) == Year}.reduce(:*)
  end
end

