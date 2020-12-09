$LOAD_PATH <<  '../lib'
require 'handheld'

class Advent8
  def initialize(input)
      @code = []
      input.each_line do |inst|
        stmt = inst.split
        @code << {:inst => stmt[0].to_sym, :arg => stmt[1].to_i}
      end  
  end

  def part1
    handheld = AoC::Handheld.new @code
    handheld.run
    handheld.accumulator
  end  

  def part2
    handheld = nil
    @code.each_index do |idx|
      inst = @code[idx][:inst]
      if inst == :nop or inst == :jmp
        cs = @code.map(&:dup)
        cs[idx][:inst] = (inst == :nop ? :jmp : :nop)
        handheld = AoC::Handheld.new cs
        handheld.run
        break if handheld.ip == @code.size
      end
    end 
    handheld.accumulator
  end 
end
