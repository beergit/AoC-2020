#!/usr/bin/ruby
require_relative 'advent17'

puts "part1: #{Advent17.new(IO.read('input.txt'), 3).part}"
puts "part2: #{Advent17.new(IO.read('input.txt'), 4).part}"
