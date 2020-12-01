#!/usr/bin/ruby
require_relative "advent1"
require "test/unit"
class TestAdvent1 < Test::Unit::TestCase
 
  def setup
    @test1_1  = ['test_input.txt', 514579]
    @test2_1  = ['test_input.txt', 241861950]
  end  

  def test_part1
    assert_equal(@test1_1[1], Advent1.new(@test1_1[0], 2).coin_product)
  end

  def test_part2
    assert_equal(@test2_1[1], Advent1.new(@test2_1[0], 3).coin_product)
  end
end
