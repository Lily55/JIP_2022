class PalindromesController < ApplicationController
  def input
  end

  def view
    @num = params[:num].to_i
    @result = check_number(@num)
  end

  private

  def check_number(numb)
    (1..numb).select { |x| x.to_s == x.to_s.reverse && x.to_s(2).to_s == x.to_s(2).to_s.reverse }
  end
end
