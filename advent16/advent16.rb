class Advent16
  def initialize(input)
    @fields = {}
    @tickets = {:my => [], :near_by => []}
    ticket = :my
    input.each_line(chomp: true) do |line|
      pm = /([a-z ]+):\s+(\d+)-(\d+)\s+or\s++(\d+)-(\d+)/.match line
      @fields[pm[1]] = [(pm[2].to_i..pm[3].to_i), (pm[4].to_i..pm[5].to_i)] if pm
      @tickets[ticket] << line.split(',').map(&:to_i) if line =~ /(\d+,)+\d+/
      ticket = :near_by if line == 'nearby tickets:'
    end
  end

  def part1
    @tickets[:near_by].map{|t| t.select{|n| @fields.values.flatten.none?{|v| v.include? n}}}.flatten.sum
  end  

  def part2
    single_fields = []
    @tickets[:near_by].transpose.each do |columns|
      single_fields << []
      columns.each do |c|
        k = @fields.select{|k, v| v.any?{|r| r.include? c}}.keys
        next if k.empty?
        single_fields[-1] = (single_fields.last.empty? ? k : single_fields[-1] & k)
      end  
    end
    sf_queue = single_fields.select{|f| f.size == 1}.flatten
    until sf_queue.empty?
      f1 = sf_queue.shift
      single_fields.each do |sf|
        if sf.include?(f1) and sf.size > 1
          sf.delete f1
          sf_queue << sf[0] if sf.size == 1 
        end
      end
    end
    single_fields.each_index.select{|idx| single_fields[idx][0].start_with?("departure")}.inject(1){|s, idx| s *=  @tickets[:my][0][idx]}
  end
end
