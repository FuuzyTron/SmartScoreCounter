class SettingsController < ApplicationController
  before_action :require_login

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(settings_params)
      save_schedule_days!
      redirect_to root_path, notice: "Сохранено"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def update_points
    @user = current_user
    delta = params[:delta].to_i
    current = @user.current_points || 0

    new_value = [[current + delta, 0].max, 100].min

    @user.update!(current_points: new_value)

    redirect_to root_path, notice: "Баллы обновлены на #{delta}"
  end

  private

  def settings_params
    params.require(:user).permit(:name, :target_points, :current_points, :semester_goal_lessons)
  end

  def save_schedule_days!
    days = Array(params[:days])
    @user.schedule_days.delete_all
    days.each { |day| @user.schedule_days.create!(day_of_week: day) }
  end
end
