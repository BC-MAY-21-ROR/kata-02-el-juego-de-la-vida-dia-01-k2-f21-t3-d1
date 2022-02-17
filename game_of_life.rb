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

neighbors = Matrix.build(x,y) {0}
x.times do |i|
  y.times do |j|   
    unless (i==0 || j==0)
     neighbors[i,j] += m[i-1,j-1]
    end
    unless i==0
      neighbors[i,j] += m[i-1,j] 
    end
    unless j==y-1 || i==0
      neighbors[i,j] += m[i-1,j+1] 
    end
    unless j==0
     neighbors[i,j] += m[i,j-1] 
    end
    unless j==y-1
      neighbors[i,j] += m[i,j+1] 
    end
    unless i==x-1 || j==0
      neighbors[i,j] += m[i+1,j-1] 
    end
    unless i==x-1
      neighbors[i,j] += m[i+1,j] 
    end
    unless i==x-1 || j==y-1
      neighbors[i,j] += m[i+1,j+1] 
    end
    # print neighbors[i,j]
  end
  #puts ""
end
x.times do |i|
  y.times do |j|   
    if(neighbors[i,j]<2 || neighbors[i,j]>3)
      m[i,j] = 0    
    elsif(neighbors[i,j]==3)
      m[i,j] = 1
    end
  end
end

puts 'generation 2'
show_m(x, y, m)
