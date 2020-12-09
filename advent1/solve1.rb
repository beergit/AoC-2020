#!/usr/bin/ruby
require_relative "advent1"

puts "part1: #{Advent1.new(File.read('input.txt'), 2).coin_product}"
puts "part2: #{Advent1.new(File.read('input.txt'), 3).coin_product}"
