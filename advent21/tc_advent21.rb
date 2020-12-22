#!/usr/bin/ruby
require_relative 'advent21'
require 'test/unit'
class TestAdvent21 < Test::Unit::TestCase

TestData1_1 = <<EOF
  mxmxvkd kfcds sqjhc nhms (contains dairy, fish)
  trh fvjkl sbzzf mxmxvkd (contains dairy)
  sqjhc fvjkl (contains soy)
  sqjhc mxmxvkd sbzzf (contains fish)
EOF
 
  def setup
    @test1_1  = [TestData1_1, 5]
  end

  def test_part1
    assert_equal(@test1_1[1], Advent21.new(@test1_1[0]).part1)
  end

  def test_part2
  end
end
