# frozen_string_literal: true

# class OneSymbol
class OneSymbol
  attr_accessor :name, :class, :code

  def initialize(name)
    @name = name
    @class = name.class
    @code = name.unpack('U*')
  end

  def print
    puts "The symbol is: #{@name}"
  end
end

# class that is child from OneSymbol
class OneSymbolWithShrift < OneSymbol
  attr_accessor :shrift

  def initialize(name, shrift)
    super(name)
    @shrift = shrift
  end

  def print
    super
    puts "The shrift is: #{@shrift}"
  end
end
