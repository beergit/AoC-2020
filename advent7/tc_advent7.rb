#!/usr/bin/ruby
require_relative 'advent7'
require 'test/unit'
class TestAdvent7 < Test::Unit::TestCase
TestData1 = <<EOF 
light red bags contain 1 bright white bag, 2 muted yellow bags.
dark orange bags contain 3 bright white bags, 4 muted yellow bags.
bright white bags contain 1 shiny gold bag.
muted yellow bags contain 2 shiny gold bags, 9 faded blue bags.
shiny gold bags contain 1 dark olive bag, 2 vibrant plum bags.
dark olive bags contain 3 faded blue bags, 4 dotted black bags.
vibrant plum bags contain 5 faded blue bags, 6 dotted black bags.
faded blue bags contain no other bags.
dotted black bags contain no other bags.
EOF

TestData2 = <<EOF 
shiny gold bags contain 2 dark red bags.
dark red bags contain 2 dark orange bags.
dark orange bags contain 2 dark yellow bags.
dark yellow bags contain 2 dark green bags.
dark green bags contain 2 dark blue bags.
dark blue bags contain 2 dark violet bags.
dark violet bags contain no other bags.
EOF

  def setup
    @test1_1  = [TestData1, 4]
    @test2_1  = [TestData1, 32]
    @test2_2  = [TestData2, 126]
  end  

  def test_part1
    assert_equal(@test1_1[1], Advent7.new(@test1_1[0]).part1)
  end

  def test_part2
    assert_equal(@test2_1[1], Advent7.new(@test2_1[0]).part2)
    assert_equal(@test2_2[1], Advent7.new(@test2_2[0]).part2)
  end
end
