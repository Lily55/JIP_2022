# frozen_string_literal: true

# class func1
class Func1
  # rubocop:disable Naming/MethodParameterName
  def self.func1(x, y)
    (((x - 1).abs**0.5) - (y.abs**0.5)) / (1 + (x**2) / 2 + (y**2) / 4)
  end
  # rubocop:enable Naming/MethodParameterName
end
