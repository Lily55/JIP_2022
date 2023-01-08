# frozen_string_literal: true

# class to calculate integral
class Integral
  S0 = 0.429798
  E = 10**-4

  def self.func(elm)
    elm / Math.sqrt(1 + elm**3)
  end

  def self.integral
    h = 0.1
    s = 0
    Enumerator.new do |y|
      loop do
        y << s
        s = 0
        (0..1).step(h) { |x| s += func(x) * h }
        h /= 2
      end
    end
  end

  def self.count
    integral.take_while { |i| (i - S0).abs > E }.last
  end
end
