#!/usr/bin/ruby
require_relative 'advent9'
require 'test/unit'
Test_input = <<EOF
20
15
25
47
40
62
55
65
95
102
117
150
182
127
219
299
277
309
576
EOF

class TestAdvent9 < Test::Unit::TestCase
 
  def setup
    @test1_1  = [Test_input, 127]
    @test2_1  = [Test_input, 62]
  end  

  def test_part1
    assert_equal(@test1_1[1], Advent9.new(@test1_1[0], 5).part1)
  end

  def test_part2
    assert_equal(@test2_1[1], Advent9.new(@test2_1[0], 5).part2)
  end
end
