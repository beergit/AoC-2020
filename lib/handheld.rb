module AoC

  class Handheld
    attr_reader(:accumulator, :ip)
    def initialize(code)
      @code = code
      @accumulator = 0
      @ip = 0
    end
    
    def run
      until ip == @code.size or @code[ip].has_key? :exec 
        prev_ip = ip
        case @code[ip][:inst]
          when :nop
            @ip += 1
          when :acc
            @accumulator += @code[ip][:arg]
            @ip += 1
          when :jmp
            @ip += @code[ip][:arg]
          else
            raise "Syntax error #{ip}:#{@code[ip]}"
        end
        raise "Permission denied" unless (0..@code.size).include? ip
        @code[prev_ip][:exec] = true
      end  
    end
  end  
end  
