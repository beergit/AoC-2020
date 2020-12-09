#!/usr/bin/ruby
 require_relative 'advent5'
require "test/unit"
class TestAdvent5 < Test::Unit::TestCase
 
  def setup
    @test1_1  = ['BFFFBBFRRR', 567]
    @test1_2  = ['FFFBBBFRRR', 119]
    @test1_3  = ['BBFFBBFRLL', 820]
    @test1_4  = ['FBFBBFFRLR', 357]
  end  

  def test_part1
    assert_equal(@test1_1[1], Advent5.new(@test1_1[0]).part1)
    assert_equal(@test1_2[1], Advent5.new(@test1_2[0]).part1)
    assert_equal(@test1_3[1], Advent5.new(@test1_3[0]).part1)
  end
end
