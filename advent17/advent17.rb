class Advent17
  def initialize(input)
    @cubes = {}
    grid = input.each_line(chomp: true).map(&:chars)
    grid.each_index{|x| grid[x].each_index{|y| @cubes[[y, x, 0]] = (grid[x][y] == '#' ? :active : :inactive)}}

  end

  def part1
  s = 0
    to_s
    1.times{s = cycle}
    to_s
    s
  end

  def part2
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
      v = (active == 3 ? :active : :inactive)
    end
    @cubes = new_cubes.merge prev_cubes
    @cubes.values.count(:active)
  end

  def neigbors(c)
     n = []
     (-1..1).each{|x| (-1..1).each{|y| (-1..1).each{|z| n << [c[0] + x, c[1] + y, c[2] + z]}}}
     n.delete c
     n
  end
  def to_s
    (@cubes.keys.min{|a, b| a[2] <=> b[2]}[2]..@cubes.keys.max{|a, b| a[2] <=> b[2]}[2]).each do |z|
      puts "z = #{z}"
      (@cubes.keys.min{|a, b| a[1] <=> b[1]}[1]..@cubes.keys.max{|a, b| a[1] <=> b[1]}[1]).each do |y|
        (@cubes.keys.min{|a, b| a[0] <=> b[0]}[0]..@cubes.keys.max{|a, b| a[0] <=> b[0]}[0]).each do |x|
          print "#{@cubes[[x, y, z]] == :active ? '#' : '.'}"
        end
        puts
      end
    end
  end





end
