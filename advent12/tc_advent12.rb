#!/usr/bin/ruby
require_relative 'advent12'
require 'test/unit'
class TestAdvent12 < Test::Unit::TestCase

TestData = <<EOF
F10
N3
F7
R90
F11
EOF


  def setup
    @test1_1  = [TestData, 25]
    @test2_1  = [TestData, 286]
  end  

  def test_part1
    assert_equal(@test1_1[1], Advent12.new(@test1_1[0]).part1)
  end

  def test_part2
    assert_equal(@test2_1[1], Advent12.new(@test2_1[0]).part2)
  end
end
