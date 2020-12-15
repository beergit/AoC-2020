#!/usr/bin/ruby
require_relative 'advent14'
require 'test/unit'
class TestAdvent14 < Test::Unit::TestCase
TestData1 = <<EOF
mask = XXXXXXXXXXXXXXXXXXXXXXXXXXXXX1XXXX0X
mem[8] = 11
mem[7] = 101
mem[8] = 0
EOF
TestData2 = <<EOF
mask = 000000000000000000000000000000X1001X
mem[42] = 100
mask = 00000000000000000000000000000000X0XX
mem[26] = 1
EOF
  def setup
    @test1_1  = [TestData1, 165]
    @test2_1  = [TestData2, 208]

  end  

  def test_part1
    assert_equal(@test1_1[1], Advent14.new(@test1_1[0]).part1)
  end

  def test_part2
    assert_equal(@test2_1[1], Advent14.new(@test2_1[0]).part2)
  end
end
