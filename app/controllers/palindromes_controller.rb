class PalindromesController < ApplicationController
  before_action :validate_input, only: :view
  before_action :require_login
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

  def validate_input
    unless valid(params[:num])
      redirect_to input_path, alert: 'You should enter a natural number in field'
    end
  end

  def valid(input)
    return false if input.to_i.zero?

    /\A\d+\Z/.match?(input)
  end

  def require_login
    redirect_to root_path if session[:current_user_id].nil?
  end
end
