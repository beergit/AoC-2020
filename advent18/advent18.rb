class Advent18
  def initialize(input)
    @expressions = input.each_line(chomp: true).map{|line| line.delete(' ').chars}
  end

  def part1
    @expressions.inject(0){|s, e| s += calculate(e, 0)[0]}
  end

  def part2
    @expressions.inject(0){|s, e| s += calculate(stapler(e), 0)[0]}
  end

  private 

  def calculate(exp, pos)
    operator = nil
    result = nil
    until exp[pos] == ')' or pos == exp.size
      case exp[pos]
        when '('
          val, pos = calculate(exp, pos + 1)
          result = operate(operator, result, val)
        when /[+*]/
          operator = exp[pos]
        when /[0-9]/
          result = operate(operator, result, exp[pos].to_i)
        else  
          raise "Error <#{exp}>"
      end
      pos += 1
    end
    [result, pos]
  end  

  def operate(operator, result, val)
    case operator
      when '+'
        result = 0 unless result
        result += val 
      when '*'
        result = 1 unless result
        result *= val 
      when nil
        result = val  
      else
        raise "Error: Illegal operator #{operator}"
    end
    result
  end  

  def stapler(in_exp)
    offset = 0
    exp = in_exp.clone
    while(pos = exp[offset..].index('+'))
      pos += offset
      if(exp[pos - 1] == ')')
        trace = pos - 2
        cnt = 1
        until cnt == 0
          cnt += 1 if exp[trace] == ')'
          cnt -= 1 if exp[trace] == '('
          trace -= 1
          raise "Error" if trace < -1
        end
        exp.insert(trace + 1, '(')
      else
        exp.insert(pos - 1, '(')
      end
      if(exp[pos + 2] == '(')
        trace = pos + 3
        cnt = 1
        until cnt == 0
          cnt += 1 if exp[trace] == '('
          cnt -= 1 if exp[trace] == ')'
          trace += 1
          raise "Error" if trace > exp.size
        end
        exp.insert(trace, ')')
      else
        exp.insert(pos + 3, ')')
      end
      offset = pos + 2
    end
    exp
  end  
  
end
