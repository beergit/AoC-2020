class Advent3
Slopes =[
    {:right => 1, :down => 1},
    {:right => 3, :down => 1},
    {:right => 5, :down => 1},
    {:right => 7, :down => 1},
    {:right => 1, :down => 2}
  ]
  attr_reader(:trees)
  def initialize(input_file, slopes)
    @forest = File.readlines(input_file, chomp: true).map(&:chars)
    @trees = slopes.inject(1){|p, s| p *= @forest.each_index.count{|idx| @forest[Slopes[s][:down]*idx] and @forest[Slopes[s][:down]*idx][Slopes[s][:right]*idx % @forest[0].size] == '#'}}
  end
end
