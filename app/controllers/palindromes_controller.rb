class PalindromesController < ApplicationController
  def input
  end

  def view
    @n = params[:n].to_i
    @results = check_number(@n)
  end

  private

  def check_number(numb)
    (1..numb).select { |x| x.to_s == x.to_s.reverse && x.to_s(2).to_s == x.to_s(2).to_s.reverse }
  end
end
