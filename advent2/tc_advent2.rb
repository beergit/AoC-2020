#!/usr/bin/ruby
require_relative 'advent2'
require "test/unit"
class TestAdvent2 < Test::Unit::TestCase
 
TestData = <<EOF
1-3 a: abcde
1-3 b: cdefg
2-9 c: ccccccccc
EOF

  def setup
    @test1_1  = [TestData, 2]
    @test2_1  = [TestData, 1]
  end  

  def test_part1
    assert_equal(@test1_1[1], Advent2.new(@test1_1[0]).part1)
  end

  def test_part2
    assert_equal(@test2_1[1], Advent2.new(@test2_1[0]).part2)
  end
end
