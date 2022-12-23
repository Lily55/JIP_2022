class SessionsController < ApplicationController
  def new
  end

  def create
    user_params = params.require(:session)

    user = User.find_by(username: user_params[:username])&.authenticate(user_params[:password])

    if user.present?
      session[:user_id] = user.id
      flash[:success] = 'Вы вошли на сайт'
      redirect_to root_path
    else
      flash.now[:notice] = 'Неправильный логин или пароль'
      render :new
    end
  end



  def destroy
    reset_session
    @current_user = nil
  
    redirect_to home_path, notice: 'Вы вышли из аккаунта'
  end
end
