Directions = [:East, :North, :West, :South]
Moves = {:East => [1, 0], :South => [0, -1], :West => [-1, 0], :North => [0, 1]}

class Advent12
  def initialize(input)
    @instructions = input.each_line(chomp: true).map{|line| [line[0].to_sym, line[1..].to_i]}
    @face = :East
    @ship = [0, 0]
    @waypoint = [10, 1]
  end

  def part1
    @instructions.each do |inst|
      case inst[0]
        when :N
          @ship[1] += inst[1]
        when :E
          @ship[0] += inst[1]
        when :S
          @ship[1] -= inst[1]
        when :W
          @ship[0] -= inst[1]
        when :L
          @face = Directions.rotate(inst[1]/90)[Directions.index(@face)]
        when :R
          @face = Directions.rotate(-inst[1]/90)[Directions.index(@face)]
        when :F
          @ship = [@ship[0] + Moves[@face][0]*inst[1], @ship[1] + Moves[@face][1]*inst[1]]
      end
    end
    @ship[0].abs + @ship[1].abs
  end

def part2
    @instructions.each do |inst|
      case inst[0]
        when :N
          @waypoint[1] += inst[1]
        when :E
          @waypoint[0] += inst[1]
        when :S
          @waypoint[1] -= inst[1]
        when :W
          @waypoint[0] -= inst[1]
        when :L
          case inst[1]
            when 90
            @waypoint = [-(@waypoint[1] - @ship[1]) + @ship[0], @waypoint[0] - @ship[0] + @ship[1]]
            when 180
            @waypoint = [-(@waypoint[0] - @ship[0]) + @ship[0], -(@waypoint[1] - @ship[1]) + @ship[1]]
            when 270
            @waypoint = [@waypoint[1] - @ship[1] + @ship[0], -(@waypoint[0] - @ship[0]) + @ship[1]]
          end
        when :R
          case inst[1]
            when 90
            @waypoint = [@waypoint[1] - @ship[1] + @ship[0], -(@waypoint[0] - @ship[0]) + @ship[1]]
            when 180
            @waypoint = [-(@waypoint[0] - @ship[0]) + @ship[0], -(@waypoint[1] - @ship[1]) + @ship[1]]
            when 270
            @waypoint = [-(@waypoint[1] - @ship[1]) + @ship[0], @waypoint[0] - @ship[0] + @ship[1]]
          end
        when :F
          prev_ship = Array.new(@ship) 
          @ship = [@ship[0] + inst[1]*(@waypoint[0] - @ship[0]), @ship[1] + inst[1]*(@waypoint[1] - @ship[1])]
          @waypoint = [@waypoint[0] + @ship[0] - prev_ship[0], @waypoint[1] + @ship[1] - prev_ship[1]]
      end
    end
    @ship[0].abs + @ship[1].abs
  end


end
