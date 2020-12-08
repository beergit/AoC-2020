#!/usr/bin/ruby

require 'test/unit'
require 'test/unit/ui/console/testrunner'
require_relative "advent1/tc_advent1"
require_relative "advent2/tc_advent2"
require_relative "advent3/tc_advent3"
require_relative "advent4/tc_advent4"
require_relative "advent5/tc_advent5"
require_relative "advent6/tc_advent6"
require_relative "advent7/tc_advent7"
require_relative "advent8/tc_advent8"

class AoC2020TestSuite < Test::Unit::TestSuite
    def self.suite
        suites = self.new("AoC Test Suite")
        suites << TestAdvent1
        suites << TestAdvent2
        suites << TestAdvent3
        suites << TestAdvent4
        suites << TestAdvent5
        suites << TestAdvent6
        suites << TestAdvent7
        suites << TestAdvent8
        return suites
    end
end
runner = Test::Unit::UI::Console::TestRunner.new(AoC2020TestSuite)
