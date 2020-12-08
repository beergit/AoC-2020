#!/usr/bin/ruby
require_relative "advent8"
require "test/unit"
class TestAdvent8 < Test::Unit::TestCase
 
  def setup
    @test1_1  = ['test_input.txt', 5]
    @test2_1  = ['test_input.txt', 8]
  end  

  def test_part1
    assert_equal(@test1_1[1], Advent8.new(@test1_1[0]).part1)
  end

  def test_part2
    assert_equal(@test2_1[1], Advent8.new(@test2_1[0]).part2)
  end
end
