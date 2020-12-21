def print_it(name, a)
  str = "#{name}\n" 
  a.each do |r|
    str  += "#{("%2d "*r.size) % r}\n"
  end
  str
end  
def rot_90(a)
  a.transpose.map(&:reverse)
end

a = [[1,2,3,4],[5,6,7,8],[9,10,11,12],[13,14,15,16]]
puts print_it("raw", a)
puts print_it("rot 90", rot_90(a))
puts print_it("rot 180", rot_90(rot_90(a)))
puts print_it("rot 270", rot_90(rot_90(rot_90(a))))
puts print_it("flip vert", a.reverse)
puts print_it("flip vert rot 90", rot_90(a.reverse))
puts print_it("flip vert rot 270", rot_90(rot_90(rot_90(a.reverse))))
puts print_it("flip hor", a.map(&:reverse))



