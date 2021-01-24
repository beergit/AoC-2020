class Advent24
  Dirs = {
    :nw => ->(p){[p[0],     p[1] + 1, p[2] - 1]},
    :ne => ->(p){[p[0] + 1, p[1],     p[2] - 1]},
    :e  => ->(p){[p[0] + 1, p[1] - 1, p[2]]},
    :se => ->(p){[p[0],     p[1] - 1, p[2] + 1]},
    :sw => ->(p){[p[0] - 1, p[1],     p[2] + 1]},
    :w  => ->(p){[p[0] - 1, p[1] + 1, p[2]]}
    }

  def initialize(input)
    @tiles = {}
    input.each_line(chomp: true){|line| walk(line)}
  end

  def part1
    @tiles.values.count{|t| t == :black}
  end  

  def part2
    100.times do
      tile_array = @tiles.to_a
      new_tiles = {}
      new_neigbors = []
      until tile_array.empty? and new_neigbors.empty?
        tile = tile_array.empty? ? new_neigbors.shift : tile_array.shift
        black_cnt = 0
        Dirs.values.each do |v|
          npos = v.call(tile[0])
          new_neigbors.push [npos, :white] unless @tiles.has_key?(npos) or @tiles[tile[0]] == :white or tile_array.empty?
          black_cnt += 1 if(@tiles[npos] == :black)
        end
        if tile[1] == :black and (black_cnt == 0 or black_cnt > 2)
          new_tiles[tile[0]] = :white 
        elsif tile[1] == :white and black_cnt == 2
          new_tiles[tile[0]] = :black 
        else
          new_tiles[tile[0]] = tile[1] 
        end  
      end  
      @tiles = new_tiles
    end
    @tiles.values.count{|t| t == :black}
  end

  private

  def walk(line)
    pos = [0, 0, 0]
    line.scan(/(e)|(se)|(sw)|(w)|(nw)|(ne)/).flatten.compact.map(&:to_sym).each{|dir| pos = Dirs[dir].call(pos)}
    @tiles[pos] ||= :white
    @tiles[pos] = (@tiles[pos] == :black ? :white : :black)
  end

end
    
