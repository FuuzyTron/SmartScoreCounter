class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(login: params[:login])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Вход выполнен"
    else
      flash.now[:alert] = "Неверный ник или пароль"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: "Выход выполнен"
  end
end
