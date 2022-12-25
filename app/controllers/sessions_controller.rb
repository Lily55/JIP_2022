class SessionsController < ApplicationController
  def new
  end

  def create
    user_params = params.require(:session)

    user = User.find_by(username: user_params[:username])&.authenticate(user_params[:password])

    if user.present?
      
      session[:user_id] = user.id
      flash[:success] = "#{t('form.logged_in')}"
      redirect_to root_path
    else
      flash.now[:notice] = "#{t('form.uncorrect')}"
      render :new
    end
  end



  def destroy
    reset_session
    @current_user = nil
  
    redirect_to home_path, notice: 'Вы вышли из аккаунта'
  end
end
