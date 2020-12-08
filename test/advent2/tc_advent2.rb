#!/usr/bin/ruby
require_relative "../../advent2/advent2"
require "test/unit"
class TestAdvent2 < Test::Unit::TestCase
 
  def setup
    @test1_1  = ['advent2/test_input.txt', 2]
    @test2_1  = ['advent2/test_input.txt', 1]
  end  

  def test_part1
    assert_equal(@test1_1[1], Advent2.new(@test1_1[0]).part1)
  end

  def test_part2
    assert_equal(@test2_1[1], Advent2.new(@test2_1[0]).part2)
  end
end
