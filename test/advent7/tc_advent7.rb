#!/usr/bin/ruby
require_relative "../../advent7/advent7"
require "test/unit"
class TestAdvent7 < Test::Unit::TestCase
 
  def setup
    @test1_1  = ['advent7/test_input1.txt', 4]
    @test2_1  = ['advent7/test_input1.txt', 32]
    @test2_2  = ['advent7/test_input2.txt', 126]
  end  

  def test_part1
    assert_equal(@test1_1[1], Advent7.new(@test1_1[0]).part1)
  end

  def test_part2
    assert_equal(@test2_1[1], Advent7.new(@test2_1[0]).part2)
    assert_equal(@test2_2[1], Advent7.new(@test2_2[0]).part2)
  end
end
