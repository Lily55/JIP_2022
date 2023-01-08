# frozen_string_literal: true

# include Number_max.rb

require './logic'

# Entering the array

puts 'Enter the array:'
arr = gets.chomp.split

# Put the array

puts 'The array is:'
p arr

# Put the max number of similar elements

puts "CountMax is: #{NumberMax.function_of_search(arr)}"
