class MainController < ApplicationController
  before_action :require_login
  def index
    @user = User.first  # For testing
  end

  def index
    return unless current_user

    @selected_days = current_user.schedule_days.pluck(:day_of_week)
  end


end
