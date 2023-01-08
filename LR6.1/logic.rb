# frozen_string_literal: true

# class to calculate Integral
class Integral
  include Math

  S0 = 0.429798
  E = 1e-3

  def self.func(elm)
    elm / Math.sqrt(1 + elm**3)
  end

  # rubocop:disable Metrics/MethodLength
  def self.integral
    s = 0
    h = 0.1
    while (s - S0).abs > E
      s = 0
      x = 0
      while (x + h) <= 1
        s += func(x) * h
        x += h
      end
      h /= 2
    end
    s
  end
  # rubocop:enable Metrics/MethodLength
end
