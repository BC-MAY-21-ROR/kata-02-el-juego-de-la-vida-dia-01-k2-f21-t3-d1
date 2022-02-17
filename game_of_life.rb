# frozen_string_literal: true

require 'matrix'
puts 'Insert rows:'
x = gets.chomp.to_i
puts 'Inserte columns:'
y = gets.chomp.to_i
m = Matrix.build(x, y) { rand(2) }

def show_m(x, y, m)
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
flag = true
generation = 2
while flag
  neighbours = Matrix.build(x, y) { 0 }
  x.times do |i|
    y.times do |j|
      neighbours[i, j] += m[i - 1, j - 1] unless i.zero? || j.zero?
      neighbours[i, j] += m[i - 1, j] unless i.zero?
      neighbours[i, j] += m[i - 1, j + 1] unless j == y - 1 || i.zero?
      neighbours[i, j] += m[i, j - 1] unless j.zero?
      neighbours[i, j] += m[i, j + 1] unless j == y - 1
      neighbours[i, j] += m[i + 1, j - 1] unless i == x - 1 || j.zero?
      neighbours[i, j] += m[i + 1, j] unless i == x - 1
      neighbours[i, j] += m[i + 1, j + 1] unless i == x - 1 || j == y - 1
    end
  end
  x.times do |i|
    y.times do |j|
      if neighbours[i, j] < 2 || neighbours[i, j] > 3
        m[i, j] = 0
      elsif neighbours[i, j] == 3
        m[i, j] = 1
      end
    end
  end

  puts "generation #{generation}"
  show_m(x, y, m)
  generation += 1
  puts 'Do you want to see another generation? y/n'
  answer = gets.chomp
  flag = answer == 'y'
end
