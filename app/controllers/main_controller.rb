class MainController < ApplicationController
  def index
    return unless current_user

    @selected_days = current_user.schedule_days.pluck(:day_of_week)

    # ✅ PASS DB VALUES + computed target_range
    @points_strategy = PointsStrategy.compute(
      user: current_user,                    # DB: semester_goal_lessons, schedule_days
      target_points: current_user.target_points.to_i,  # DB target
      target_range: compute_target_range(current_user.target_points.to_i)
    )
  end

  def calculate_strategy
    return head :unauthorized unless current_user

    lessons = params[:semester_goal_lessons].to_i
    target = params[:target_points].to_i

    @points_strategy = PointsStrategy.compute(
      user: current_user,                    # For schedule_days
      target_points: target,                 # From AJAX params
      semester_goal_lessons: lessons,        # From AJAX params
      target_range: (target..(target + 14))  # Dynamic range
    )

    render json: @points_strategy
  end

  private

  def compute_target_range(points)
    case points
    when 60..70 then (60..70)
    when 71..84 then (71..84)
    else (85..100)
    end
  end
end
