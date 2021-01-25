#!/usr/bin/ruby
require_relative 'advent18'
require 'test/unit'
class TestAdvent18 < Test::Unit::TestCase
 
    TestData1_1 = '2 * 3 + (4 * 5)'
    TestData1_2 = '5 + (8 * 3 + 9 + 3 * 4 * 3)'
    TestData1_3 = '5 * 9 * (7 * 3 * 3 + 9 * 3 + (8 + 6 * 4))'
    TestData1_4 = '((2 + 4 * 9) * (6 + 9 * 8 + 6) + 6) + 2 + 4 * 2'
    TestData2_1 = '1 + (2 * 3) + (4 * (5 + 6))'
    TestData2_2 = '2 * 3 + (4 * 5)'
    TestData2_3 = '5 + (8 * 3 + 9 + 3 * 4 * 3)'
    TestData2_4 = '5 * 9 * (7 * 3 * 3 + 9 * 3 + (8 + 6 * 4))'
    TestData2_5 = '((2 + 4 * 9) * (6 + 9 * 8 + 6) + 6) + 2 + 4 * 2'

  def setup
    @test1_1  = [TestData1_1, 26]
    @test1_2  = [TestData1_2, 437]
    @test1_3  = [TestData1_3, 12240]
    @test1_4  = [TestData1_4, 13632]
    @test2_1  = [TestData2_1, 51]
    @test2_2  = [TestData2_2, 46]
    @test2_3  = [TestData2_3, 1445]
    @test2_4  = [TestData2_4, 669060]
    @test2_5  = [TestData2_5, 23340]
  end  

  def test_part1
    assert_equal(@test1_1[1], Advent18.new(@test1_1[0]).part1)
    assert_equal(@test1_2[1], Advent18.new(@test1_2[0]).part1)
    assert_equal(@test1_3[1], Advent18.new(@test1_3[0]).part1)
    assert_equal(@test1_4[1], Advent18.new(@test1_4[0]).part1)
  end

  def test_part2
    assert_equal(@test2_1[1], Advent18.new(@test2_1[0]).part2)
    assert_equal(@test2_2[1], Advent18.new(@test2_2[0]).part2)
    assert_equal(@test2_3[1], Advent18.new(@test2_3[0]).part2)
    assert_equal(@test2_4[1], Advent18.new(@test2_4[0]).part2)
    assert_equal(@test2_5[1], Advent18.new(@test2_5[0]).part2)
  end
end
