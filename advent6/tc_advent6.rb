#!/usr/bin/ruby
require_relative 'advent6'
require 'test/unit'
class TestAdvent6 < Test::Unit::TestCase
 
TestData = <<EOF
abc

a
b
c

ab
ac

a
a
a
a

b
EOF

  def setup
    @test1_1  = [TestData, 11]
    @test2_1  = [TestData, 6]
  end  

  def test_part1
    assert_equal(@test1_1[1], Advent6.new(@test1_1[0]).part1)
  end
  def test_part2
    assert_equal(@test2_1[1], Advent6.new(@test2_1[0]).part2)
  end

end
