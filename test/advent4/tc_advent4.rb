#!/usr/bin/ruby
require_relative "../../advent4/advent4"
require "test/unit"
class TestAdvent4 < Test::Unit::TestCase
 
  def setup
    @test1_1  = ['advent4/test_part1_input.txt', 2]
    @test2_1  = ['advent4/test_part2_valid_input.txt', 4]
    @test2_2  = ['advent4/test_part2_invalid_input.txt', 0]
  end  

  def test_part1
    assert_equal(@test1_1[1], Advent4.new(@test1_1[0]).part1)
  end

  def test_part2
    assert_equal(@test2_1[1], Advent4.new(@test2_1[0]).part2)
    assert_equal(@test2_2[1], Advent4.new(@test2_2[0]).part2)
  end
end
