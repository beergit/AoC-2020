#!/usr/bin/ruby
require_relative "advent5"
require "test/unit"
class TestAdvent1 < Test::Unit::TestCase
 
  def setup
    @test1_1  = ['test_part1_input1.txt', 567]
    @test1_2  = ['test_part1_input2.txt', 119]
    @test1_3  = ['test_part1_input3.txt', 820]
    @test1_4  = ['test_part1_input4.txt', 357]
  end  

  def test_part1
    assert_equal(@test1_1[1], Advent5.new(@test1_1[0]).part1)
    assert_equal(@test1_2[1], Advent5.new(@test1_2[0]).part1)
    assert_equal(@test1_3[1], Advent5.new(@test1_3[0]).part1)
  end
end
