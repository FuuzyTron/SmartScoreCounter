class ApplicationController < ActionController::Base
  helper_method :current_user, :signed_in?

  private

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = User.find_by(id: session[:user_id])
  end

  def signed_in?
    current_user.present?
  end

  def require_login
    redirect_to login_path, alert: "Нужно войти" unless signed_in?
  end
end
