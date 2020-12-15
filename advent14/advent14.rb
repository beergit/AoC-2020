class Advent14
  def initialize(input)
    @input = input
    @mask_regex = /((mask)|(mem\[(\d*)\]))\s*=\s*(([10X]{36})|(\d+))/
  end

  def part1
    mem = {}
    mask = ''
    @input.each_line(chomp: true) do |line|
      pm = @mask_regex.match(line)
      if pm[1] == 'mask'
        mask = pm[5]
      else
        mem[pm[4].to_i] = ("%036b" % [pm[5]]).chars.zip(mask.chars).map{|z| z[1] == 'X' ? z[0] : z[1]}.join.to_i(2)
      end
    end
    mem.values.sum
  end  

  def part2
    mem = {}
    mask = ''
    cnt_x = 0
    @input.each_line(chomp: true) do |line|
      pm = @mask_regex.match(line)
      if pm[1] == 'mask'
        mask = pm[5]
        cnt_x = mask.count('X')
      else
        (1 << cnt_x).times do |t|
          mask2 = mask.dup
          offset = 0
          cnt_x.times do |n|
            idx = mask2.index('X', offset)
            mask2[idx] = (((t >> (cnt_x - n - 1))&0x01) + 2).to_s
            offset = idx + 1 
          end
          addr = ("%036b" % [pm[4]]).chars.zip(mask2.chars).map{|z| z[1] == '0' ? z[0] : (z[1].to_i > 1 ? z[1].to_i - 2 : 1)}.join.to_i(2)
          mem[addr] = pm[5].to_i
        end
      end
    end
    mem.values.sum
  end
end
