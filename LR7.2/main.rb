# frozen_string_literal: true

require_relative 'logic'

s = OneSymbol.new('s')

s.print
puts "The code of symbol is: #{s.code}"
puts "The class of symbol is: #{s.class}"

p '****************************'
s = OneSymbolWithShrift.new('s', 'amaranto')
s.print
puts "The code of symbol is: #{s.code}"
puts "The class of symbol is: #{s.class}"
puts "The shrift of symbol is: #{s.shrift}"
