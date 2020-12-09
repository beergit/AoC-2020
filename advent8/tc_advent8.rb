#!/usr/bin/ruby
require_relative 'advent8'
require 'test/unit'
class TestAdvent8 < Test::Unit::TestCase

TestData = <<EOF
nop +0
acc +1
jmp +4
acc +3
jmp -3
acc -99
acc +1
jmp -4
acc +6
EOF

  def setup
    @test1_1  = [TestData, 5]
    @test2_1  = [TestData, 8]
  end  

  def test_part1
    assert_equal(@test1_1[1], Advent8.new(@test1_1[0]).part1)
  end

  def test_part2
    assert_equal(@test2_1[1], Advent8.new(@test2_1[0]).part2)
  end
end
