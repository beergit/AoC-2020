class Advent17
  def initialize(input, dim)
    @cubes = {}
    grid = input.each_line(chomp: true).map(&:chars)
    grid.each_index do |x| 
      grid[x].each_index do |y| 
        k = [x, y, 0]
        k << 0 if dim == 4
        @cubes[k] = (grid[x][y] == '#' ? :active : :inactive)
      end
    end
  end

  def part
    s = 0
    6.times{s = cycle}
    s
  end

  private

  def cycle
    new_cubes = {}
    prev_cubes = {}
    @cubes.each do |k, v|
      active = 0
      neigbors(k).each do |n|
        new_cubes[n] = :inactive unless @cubes.has_key? n
        active += 1 if @cubes[n] == :active
      end
      prev_cubes[k] = (v == :active ? ((2..3).include?(active) ? :active : :inactive) : (active == 3 ? :active : :inactive))
    end
    new_cubes.each do |k, v|
      active = 0
      neigbors(k).each{|n| active += 1 if @cubes[n] == :active}
      new_cubes[k] = active ==3 ? :active : :inactive
    end
    @cubes = new_cubes.merge prev_cubes
    @cubes.values.count(:active)
  end

  def neigbors(c)
    n = []
    (-1..1).each do |x|
      (-1..1).each do |y|
        (-1..1).each do |z|
          if c.size == 4
            (-1..1).each{|w| n << [c[0] + x, c[1] + y, c[2] + z, c[3] + w]}
          else
            n << [c[0] + x, c[1] + y, c[2] + z]
          end  
        end
      end
    end
    n.delete c
    n
  end
end
