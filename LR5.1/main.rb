# frozen_string_literal: true

require './func1'

p 'Enter x and y:'
arr = gets.chomp.split(' ')
x = arr[0]
y = arr[1]
puts "a = #{Func1.func1(x.to_f, y.to_f).ceil(3)}"
