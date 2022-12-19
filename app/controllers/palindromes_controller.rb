class PalindromesController < ApplicationController
  def input
  end

  def view
    @num = params[:num].to_i
    res = Number.find_by_num(@num)
    if res
      @result = ActiveSupport::JSON.decode(res.result)
    else
      @result = check_number(@num)
      res = Number.create num: @num, result: ActiveSupport::JSON.encode(@result)
      res.save
    end
  end

  private

  def check_number(numb)
    (1..numb).select { |x| x.to_s == x.to_s.reverse && x.to_s(2).to_s == x.to_s(2).to_s.reverse }
  end
end
