#!/usr/bin/ruby
require_relative 'advent17'

require 'test/unit'
class TestAdvent17 < Test::Unit::TestCase
Testdata1 = <<EOF
.#.
..#
###
EOF
  def setup
    @test1_1  = [Testdata1, 112]
    @test2_1  = [Testdata1, 848]
  end  

  def test_part1
    assert_equal(@test1_1[1], Advent17.new(@test1_1[0], 3).part)
  end

  def test_part2
    assert_equal(@test2_1[1], Advent17.new(@test2_1[0], 4).part)
  end
end
