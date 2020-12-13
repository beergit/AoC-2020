#!/usr/bin/ruby
require_relative 'advent11'
require 'test/unit'
class TestAdvent11 < Test::Unit::TestCase
 
  TestData1 = <<EOF
L.LL.LL.LL
LLLLLLL.LL
L.L.L..L..
LLLL.LL.LL
L.LL.LL.LL
L.LLLLL.LL
..L.L.....
LLLLLLLLLL
L.LLLLLL.L
L.LLLLL.LL
EOF
  def setup
    @test1_1  = [TestData1, 37]
    @test2_1  = [TestData1, 26]
  end  

  def test_part1
    assert_equal(@test1_1[1], Advent11.new(@test1_1[0]).part1)
  end

  def test_part2
    assert_equal(@test2_1[1], Advent11.new(@test1_1[0]).part2)
  end
end
