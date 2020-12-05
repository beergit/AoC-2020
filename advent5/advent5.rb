class Advent5
  def initialize(input_file)
    decoders = File.readlines(input_file).map{|c| Decoder.new c}
    @codes = decoders.map{|c| c.id} 
  end
  def part1
    @codes.max
  end
  def part2
    (0..part1).find{|c| @codes.include?(c - 1) and @codes.include?(c + 1) and not @codes.include?(c)}
  end

  private
  class Decoder
    attr_reader (:id)
    def initialize(code)
      rows = [0, 127]
      columns = [0, 7]
      code.chars do |c|
        case c
          when 'F'
            rows = [rows.first, (rows.last + rows.first)/2]
          when 'B'
            rows = [(rows.last + rows.first + 1)/2, rows.last]
          when 'R'
            columns = [(columns.last + columns.first + 1)/2, columns.last]
          when 'L'
            columns = [columns.first, (columns.last + columns.first)/2]
        end
      end
      @id = (rows.first)*8 + columns.first
    end  
  end
end
      
