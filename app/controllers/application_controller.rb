class ApplicationController < ActionController::Base
    include Pagy::Backend
    include Authorization
    include Authentication
    helper_method :current_user
    before_action :set_query
    around_action :switch_locale

    def set_query
        @query = Post.ransack(params[:search])
    end

    private

    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def switch_locale(&action)
        locale = locale_from_url || I18n.default_locale
        I18n.with_locale locale, &action
    end

    def locale_from_url
        locale = params[:locale]

        return locale if I18n.available_locales.map(&:to_s).include?(locale)

        nil
    end

    def default_url_options
        { locale: I18n.locale}
    end

end
