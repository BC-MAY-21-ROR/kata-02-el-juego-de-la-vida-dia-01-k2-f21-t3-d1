# frozen_string_literal: true

require 'matrix'
puts 'Insert rows:'
x = gets.chomp.to_i
puts 'Inserte columns:'
y = gets.chomp.to_i
m = Matrix.build(x,y){ rand(2) }

def show_m (x, y, m)
x.times do |i|
  y.times do |j|
    if m[i, j] == 1
      print '*'
    else
      print '.'
    end
  end
  puts ''
 end
end

puts 'generation 1'
show_m(x, y, m)

x.times do |i|
  y.times do |j|   
    neighbors = 0
    unless (i==0 || j==0)
     neighbors += m[i-1,j-1]
    end
    unless i==0
      neighbors += m[i-1,j] 
    end
    unless j==y-1 || i==0
    neighbors += m[i-1,j+1] 
    end
    unless j==0
     neighbors += m[i,j-1] 
    end
    unless j==y-1
    neighbors += m[i,j+1] 
    end
    unless i==x-1 || j==0
    neighbors += m[i+1,j-1] 
    end
    unless i==x-1
    neighbors += m[i+1,j] 
    end
    unless i==x-1 || j==y-1
    neighbors += m[i+1,j+1] 
    end
    print neighbors
  end
  puts ""
end


# m[i-1, j-1] 
# m[i-1, j] 
# m[i-1, j+1]
# m[i, j-1]    
# m[ij]
# m[ij+1]
# m[i+1j-1]    
# m[i+1j]  
# m[i+1j+1]

# if(i==0 && j==0)
#   neighbors += m[i+1,j]
#   neighbors += m[i+1,j+1]
#   neighbors += m[i,j+1]
# elsif(i==0)
#   neighbors = 0
#   neighbors += m[i+1,j]
#   neighbors += m[i-1,j]
#   neighbors += m[i-1,j+1]
#   neighbors += m[i,j+1]
#   neighbors += m[i+1,j+1]
# end