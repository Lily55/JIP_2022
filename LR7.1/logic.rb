# frozen_string_literal: true

# library Faker
require 'faker'

# class for working with files
class WorkWithFiles
  def self.read_file
    arr_of_words = File.readlines('test.txt').map(&:chomp)
    arr_of_words.count { |x| x.length == 2 }
  end

  def self.work_with_files
    write_the_file(generate_lines) unless File.exist? 'test.txt'
    read_file
  end

  def self.generate_lines
    (1..count_lines).map { Faker::Lorem.unique.characters(number: Faker::Number.between(from: 2, to: 20)).to_s }
  end

  def self.count_lines
    srand(20)
    rand(1000)
  end

  def self.write_the_file(lines)
    f = File.new('test.txt', 'w')
    lines.each { |x| f.puts x }
    f.close
  end
end
