# frozen_string_literal: true

require 'matrix'
puts 'Insert rows:'
x = gets.chomp.to_i
puts 'Inserte columns:'
y = gets.chomp.to_i

m = Matrix.build(x, y) do
  if rand(2) == 1
    '.'
  else
    '*'
  end
end

puts 'generation 1'
x.times do |i|
  y.times do |j|
    print m[i, j]
  end
  puts ''
end
