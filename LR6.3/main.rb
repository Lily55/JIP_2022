# frozen_string_literal: true

require './logic'

puts 'Function ln(x)/x with borders [0.1, 1]:'
puts "Lambda: #{Integral.integ_lambda(->(x) { Math.log(x) / x }, 0.1, 1, 100)}"
puts "Yield:  #{Integral.integ_yield(0.1, 1, 100) { |x| Math.log(x) / x }}"

puts '*' * 80

puts 'Function sin(x)*cos(x) with borders [0, 2]:'
puts "Lambda: #{Integral.integ_lambda(->(x) { Math.sin(x) * Math.cos(x) }, 0.0, 2.0, 100)}"
puts "Yield:  #{Integral.integ_yield(0.0, 2.0, 100) { |x| Math.sin(x) * Math.cos(x) }}"
