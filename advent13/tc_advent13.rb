#!/usr/bin/ruby
require_relative 'advent13'
require 'test/unit'
class TestAdvent13 < Test::Unit::TestCase
 
TestData1 = <<EOF
939
7,13,x,x,59,x,31,19
EOF


TestData2_1 = <<EOF
939
67,7,59,61
EOF
TestData2_2 = <<EOF
939
67,x,7,59,61
EOF
TestData2_3 = <<EOF
939
67,7,x,59,61
EOF
TestData2_4 = <<EOF
939
1789,37,47,1889 
EOF
TestData2_5 = <<EOF
939
7,5,11,x,x,x,x,x,3
EOF
TestData2_6 = <<EOF
939
7,5,11,3
EOF
TestData2_7 = <<EOF
939
7,5,11,x,3
EOF
  def setup
    @test1_1  = [TestData1, 295]
    @test2_1  = [TestData2_1, 754018]
    @test2_2  = [TestData2_2, 779210]
    @test2_3  = [TestData2_3, 1261476]
    @test2_4  = [TestData2_4, 1202161486]
    @test2_5  = [TestData1, 1068781]
    @test2_6  = [TestData2_6, 504]
    @test2_7  = [TestData2_7, 119]
  end  

  def test_part1
    assert_equal(@test1_1[1], Advent13.new(@test1_1[0]).part1)
  end

  def test_part2
    assert_equal(@test2_1[1], Advent13.new(@test2_1[0]).part2)
    assert_equal(@test2_2[1], Advent13.new(@test2_2[0]).part2)
    assert_equal(@test2_3[1], Advent13.new(@test2_3[0]).part2)
    assert_equal(@test2_4[1], Advent13.new(@test2_4[0]).part2)
    assert_equal(@test2_5[1], Advent13.new(@test2_5[0]).part2)
    assert_equal(@test2_6[1], Advent13.new(@test2_6[0]).part2)
    assert_equal(@test2_7[1], Advent13.new(@test2_7[0]).part2)
  end
end
