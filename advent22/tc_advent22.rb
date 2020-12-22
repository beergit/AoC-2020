#!/usr/bin/ruby
require_relative 'advent22'
require 'test/unit'
class TestAdvent22 < Test::Unit::TestCase
TestData = <<EOF
Player 1:
9
2
6
3
1

Player 2:
5
8
4
7
10
EOF

  def setup
    @test1_1  = [TestData, 306]
    @test2_1  = [TestData, 291]
  end  

  def test_part1
    assert_equal(@test1_1[1], Advent22.new(@test1_1[0]).part1)
  end

  def test_part2
    assert_equal(@test2_1[1], Advent22.new(@test2_1[0]).part2)
  end
end
