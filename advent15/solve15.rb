#!/usr/bin/ruby
require_relative "advent15"

puts "part1: #{Advent15.new([0, 1, 5, 10, 3, 12, 19], 2020).last_number}"
puts "part2: #{Advent15.new([0, 1, 5, 10, 3, 12, 19], 30000000).last_number}"
