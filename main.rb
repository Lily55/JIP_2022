# frozen_string_literal: true

require './logic'

puts 'Enter the array:'
arr = gets.chomp.split

SortAsHash.puts_hash(arr)
