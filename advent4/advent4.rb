class Advent4
  def initialize(input)
    @passports = input.split(/\n{2,}/).map{|id| Passport.new(id)}
  end

  def part1
    @passports.count{|p| p.valid_part1?}
  end
  def part2
    @passports.count{|p| p.valid_part2?}
  end

  private
    class Passport
      HeightRanges = {:cm => (150..193), :in => (59..76)}
      EyeColors = %w(amb blu brn gry grn hzl oth)
      Validations = {
        :byr => lambda {|v| (1920..2002).include? v.to_i},
        :iyr => lambda {|v| (2010..2020).include? v.to_i},
        :eyr => lambda {|v| (2020..2030).include? v.to_i},
        :hgt => lambda {|v| v =~ /^(\d+)((cm)|(in))$/ and HeightRanges[$2.to_sym].include?($1.to_i)},
        :hcl => lambda {|v| v =~ /^#[0-9a-f]{6}$/},
        :ecl => lambda {|v| EyeColors.include? v},
        :pid => lambda {|v| v =~ /^\d{9}$/}
      }
      def initialize(id)
        @ids = id.split.map{|id| id.split(':')}.map{|id| [id[0].to_sym, id[1]]}.to_h
      end

      def valid_part1?
        (Validations.keys - @ids.keys).empty?
      end

      def valid_part2?
        Validations.all?{|k, v| @ids[k] and v[@ids[k]]}
      end  
    end
end
