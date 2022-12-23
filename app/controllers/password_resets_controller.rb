class PasswordResetsController < ApplicationController
  before_action :set_user, only: %i[edit update]
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user.present?
      @user.set_password_reset_token

      PasswordResetMailer.with(user: @user).reset_email.deliver_later
    end

    flash[:success] = "Письмо было отправлено!"
    redirect_to new_session_path
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = 'Пароль был изменён'
      redirect_to new_session_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :passwordconfirmation)
  end

  def set_user
    redirect_to( new_session_path) unless params[:user].present?
    @user = User.find_by(email: params[:user][:email])
                        # password_reset_token: params[:user][:password_reset_token])
    flash[:warning] = "Пользователь не найден" if @user.nil?
    redirect_to( new_session_path) unless @user&.password_reset_period_valid?
  end
end
