class NumbersController < ApplicationController

  def show
    @upper = params[:upper].to_i
    @data = find_palindromes(@upper)
    @data = @data.map { |elem| { elem: elem, binary: elem.to_s(2) } }

    respond_to do |format|
      format.xml { render xml: @data.to_xml }
      format.rss { render xml: @data.to_xml }
    end
  end

  def find_palindromes(numb)
    (1..numb).select { |x| x.to_s == x.to_s.reverse && x.to_s(2).to_s == x.to_s(2).to_s.reverse }
  end
end
