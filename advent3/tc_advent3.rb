#!/usr/bin/ruby
require_relative "advent3"
require "test/unit"
class TestAdvent3 < Test::Unit::TestCase
 
  def setup
    @test1_1  = ['test_input.txt', [0], 2]
    @test1_2  = ['test_input.txt', [1], 7]
    @test1_3  = ['test_input.txt', [2], 3]
    @test1_4  = ['test_input.txt', [3], 4]
    @test1_5  = ['test_input.txt', [4], 2]
    @test2_1  = ['test_input.txt', [0, 1, 2, 3, 4], 336]
  end  

  def test_part1
    assert_equal(@test1_1[2], Advent3.new(@test1_1[0], @test1_1[1]).trees)
    assert_equal(@test1_2[2], Advent3.new(@test1_2[0], @test1_2[1]).trees)
    assert_equal(@test1_3[2], Advent3.new(@test1_3[0], @test1_3[1]).trees)
    assert_equal(@test1_4[2], Advent3.new(@test1_4[0], @test1_4[1]).trees)
    assert_equal(@test1_5[2], Advent3.new(@test1_5[0], @test1_5[1]).trees)
  end

  def test_part2
    assert_equal(@test2_1[2], Advent3.new(@test2_1[0], @test2_1[1]).trees)
  end
end
