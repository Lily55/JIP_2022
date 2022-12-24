class ApplicationController < ActionController::Base
    include Pagy::Backend
    include Authorization
    include Authentication
    helper_method :current_user
    
    before_action :set_query

    def set_query
        @query = Post.ransack(params[:search])
    end

    private

    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
end
