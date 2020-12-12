class Advent11
  def initialize(input)
    @seats = input.each_line(chomp: true).map(&:chars)
  end

  def part1
     occupy(true)
  end

  def part2
     occupy(false)
  end

  private 

  def occupy(near)
    n1 = @seats
    n2 = next_round(@seats, near)
    until n1 == n2
      n1 = next_round(n2, near)
      n2 = next_round(n1, near)
    end
    n2.inject(0){|s, r| s+= r.count('#')}
  end
  
  def next_round(seats, near)
    n_seats = []
    seats.each_with_index do |s, row|
      n_seats << []
      s.each_with_index{|t, col| n_seats.last << (toggle?(seats, [row, col], near) ? t.tr('L#', '#L') : t)}
    end
   n_seats
  end 
  
  def toggle?(seats, pos, near)
    seat = seats[pos[0]][pos[1]]
    return false if seat == '.'
    occ = 0
    directions = [[[-1, 0], 1], [[-1, -1], 1], [[0, -1], 1], [[1, -1], 1], [[0, 1], 1], [[1, 1], 1], [[1, 0], 1], [[-1, 1], 1]] 
    until directions.all?{|d| d[1] == 0}
      directions.each_index do |d_idx|
        next if directions[d_idx][1] == 0
        r_row = pos[0] + directions[d_idx][0][0]*directions[d_idx][1]
        unless (0...seats.size).include? r_row
          directions[d_idx][1] = 0
          next
        end  
        r_col = pos[1] + directions[d_idx][0][1]*directions[d_idx][1]
        unless (0...seats[0].size).include? r_col
          directions[d_idx][1] = 0
          next
        end  
        looked_seat = seats[r_row][r_col]
        if looked_seat == '#'
          return false if seat == 'L'
          occ += 1
          return true if seat == '#' and occ >= (4 + (near ? 0 : 1))
        end
        if(looked_seat == '.')
          directions[d_idx][1] += 1
        else
          directions[d_idx][1] = 0
        end
      end
      break if near
    end
    seat == 'L'
  end

end
    
