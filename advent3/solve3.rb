#!/usr/bin/ruby
require_relative "advent3"

puts "part1: #{Advent3.new(File.read('input.txt'), [1]).trees}"
puts "part2: #{Advent3.new(File.read('input.txt'), [0, 1, 2, 3, 4]).trees}"
