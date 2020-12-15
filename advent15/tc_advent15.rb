#!/usr/bin/ruby
require_relative 'advent15'
require 'test/unit'
class TestAdvent15 < Test::Unit::TestCase
 

  def test_part1
    assert_equal(436, Advent15.new([0,3,6], 2020).last_number)
    assert_equal(1, Advent15.new([1,3,2], 2020).last_number)
    assert_equal(10, Advent15.new([2,1,3], 2020).last_number)
    assert_equal(27, Advent15.new([1,2,3], 2020).last_number)
    assert_equal(78, Advent15.new([2,3,1], 2020).last_number)
    assert_equal(438, Advent15.new([3,2,1], 2020).last_number)
    assert_equal(1836, Advent15.new([3,1,2], 2020).last_number)
  end

  def test_part2
    assert_equal(175594, Advent15.new([0,3,6], 30000000).last_number)
    assert_equal(2578, Advent15.new([1,3,2], 30000000).last_number)
    assert_equal(3544142, Advent15.new([2,1,3], 30000000).last_number)
    assert_equal(261214, Advent15.new([1,2,3], 30000000).last_number)
    assert_equal(6895259, Advent15.new([2,3,1], 30000000).last_number)
    assert_equal(18, Advent15.new([3,2,1], 30000000).last_number)
    assert_equal(362, Advent15.new([3,1,2], 30000000).last_number)
  end
end
