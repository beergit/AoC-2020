class Advent15
  attr_reader :last_number
  def initialize(input, nth_number)
    numbers = {}
    input.each_with_index{|n, idx| numbers[n] = [idx]}
    @last_number = nil
    n_last = input.last

    (numbers.size ..nth_number - 1).each do |t|
      print "%2d%%   \r" % [(100.0*t/nth_number).round(0)] if t%1000000 == 0
      @last_number =  numbers[n_last].size == 1 ? 0 : numbers[n_last][1] - numbers[n_last][0]
      numbers.has_key?(last_number) ?  numbers[last_number] << t : numbers[last_number] = [t]
      numbers[last_number].shift if numbers[last_number].size > 2
      n_last = last_number
    end  
    puts "\rOK   "
  end
end
    
