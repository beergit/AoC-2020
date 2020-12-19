#!/usr/bin/ruby
require_relative 'advent16'
require 'test/unit'
class TestAdvent16 < Test::Unit::TestCase
 

TestData = <<EOF
class: 1-3 or 5-7
row: 6-11 or 33-44
seat: 13-40 or 45-50

your ticket:
7,1,14

nearby tickets:
7,3,47
40,4,50
55,2,20
38,6,12
EOF

  def setup
    @test1_1  = [TestData, 71]
  end  

  def test_part1
    assert_equal(@test1_1[1], Advent16.new(@test1_1[0]).part1)
  end
end
