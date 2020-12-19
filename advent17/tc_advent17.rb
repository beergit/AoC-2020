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
  end  

  def test_part1
    assert_equal(@test1_1[1], Advent17.new(@test1_1[0]).part1)
  end

  def test_part2
  end
end
