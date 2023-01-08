# frozen_string_literal: true

# class Integral
class Integral
  def self.integ_lambda(func, left_top, right_top, number)
    s = 0.0
    d = (right_top - left_top) / number
    x = left_top

    number.times do
      s += func.call(x)
      x += d
    end
    s *= d
  end

  def self.integ_yield(left_top, right_top, number)
    s = 0.0
    d = (right_top - left_top) / number
    x = left_top

    number.times do
      s += yield x
      x += d
    end
    s *= d
  end
end
