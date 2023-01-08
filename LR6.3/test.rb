# frozen_string_literal: true

require_relative 'logic'

RSpec.describe Integral do
  describe '#integ_lambda' do
    it 'should be < -2 and > -3.9 for ln(x)/x' do
      expect(Integral.integ_lambda(->(x) { Math.log(x) / x }, 0.1, 1, 100)).to be < - 2.0
      expect(Integral.integ_lambda(->(x) { Math.log(x) / x }, 0.1, 1, 100)).to be > - 3.9
    end

    it 'should be < 0.42 and > 0.4 for sin(x)*cos(x)' do
      expect(Integral.integ_yield(0.0, 2.0, 100) { |x| Math.sin(x) * Math.cos(x) }).to be > 0.4
      expect(Integral.integ_yield(0.0, 2.0, 100) { |x| Math.sin(x) * Math.cos(x) }).to be < 0.42
    end
  end

  describe '#integ_yield' do
    it 'should be < -2 and > -3.9 for ln(x)/x' do
      expect(Integral.integ_yield(0.1, 1, 100) { |x| Math.log(x) / x }).to be < - 2.0
      expect(Integral.integ_yield(0.1, 1, 100) { |x| Math.log(x) / x }).to be > - 3.9
    end

    it 'should be < 0.42 and > 0.4 for sin(x)*cos(x)' do
      expect(Integral.integ_yield(0.0, 2.0, 100) { |x| Math.sin(x) * Math.cos(x) }).to be > 0.4
      expect(Integral.integ_yield(0.0, 2.0, 100) { |x| Math.sin(x) * Math.cos(x) }).to be < 0.42
    end
  end
end
