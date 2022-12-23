module Authentication
    extend ActiveSupport::Concern

    included do

        def require_authentication
            return if user_signed_in?
      
            flash[:warning] = 'Пользователь не вошёл'
            redirect_to root_path
        end

        def user_signed_in?
            current_user.present?
        end

        def require_no_authentication
            return unless user_signed_in?
      
            flash[:warning] = 'Пользователь не вошёл'
            redirect_to root_path
        end

        helper_method :user_signed_in?
    end
end