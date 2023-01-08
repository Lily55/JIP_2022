# frozen_string_literal: true

# Class for sorting hash
class SortAsHash
  def self.sort_hash(arr = [])
    arr = arr.each_with_index { |x, index| arr[index] = x.to_i }
    hash = {}
    arr.each_with_index { |x, index| hash[x] = index }
    hash = hash.sort.to_h
    p hash
    hash
  end

  def self.puts_hash(arr = [])
    hash = sort_hash(arr)
    puts 'Even numbers:'
    hash.each { |x| puts "#{x[0]} [#{x[1]}]" if x[0].even? }
    puts 'Odd numbers:'
    hash.each { |x| puts "#{x[0]} [#{x[1]}]" if x[0].odd? }
  end
end
