#!/usr/bin/ruby
require_relative 'advent10'
require 'test/unit'
class TestAdvent10 < Test::Unit::TestCase

TestData1_1 = <<EOF
16
10
15
5
1
11
7
19
6
12
4
EOF
TestData1_2 = <<EOF
28
33
18
42
31
14
46
20
48
47
24
23
49
45
19
38
39
11
1
32
25
35
8
17
7
9
4
2
34
10
3
EOF
 
  def setup
    @test1_1  = [TestData1_1, 7*5]
    @test1_2  = [TestData1_2, 22*10]
    @test2_1  = [TestData1_1, 8]
    @test2_2  = [TestData1_2, 19208]
  end  

  def test_part1
    assert_equal(@test1_1[1], Advent10.new(@test1_1[0]).part1)
    assert_equal(@test1_2[1], Advent10.new(@test1_2[0]).part1)
  end

  def test_part2
    assert_equal(@test2_1[1], Advent10.new(@test2_1[0]).part2)
    assert_equal(@test2_2[1], Advent10.new(@test2_2[0]).part2)
  end
end
