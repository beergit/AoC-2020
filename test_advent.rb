#!/usr/bin/ruby
require 'test/unit'
require 'test/unit/ui/console/testrunner'
$LOAD_PATH <<  './lib'
(1..24).each do |n|
  $LOAD_PATH << "advent#{n}"
  require "tc_advent#{n}"
end

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
        suites << TestAdvent9
        suites << TestAdvent10
        suites << TestAdvent11
        suites << TestAdvent12
        suites << TestAdvent13
        suites << TestAdvent14
        suites << TestAdvent15
        suites << TestAdvent16
        suites << TestAdvent17
        suites << TestAdvent18
        suites << TestAdvent19
        suites << TestAdvent20
        suites << TestAdvent21
        suites << TestAdvent22
        suites << TestAdvent23
        suites << TestAdvent24
        return suites
    end
end
runner = Test::Unit::UI::Console::TestRunner.new(AoC2020TestSuite)
