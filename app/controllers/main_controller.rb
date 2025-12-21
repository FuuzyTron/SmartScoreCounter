class MainController < ApplicationController
  def index
    return unless current_user

    @selected_days = current_user.schedule_days.pluck(:day_of_week) # ["monday", ...]
    target = case current_user.target_points.to_i
             when 60..70 then (60..70)
             when 71..84 then (71..84)
             else (85..100)
             end

    weekdays = @selected_days.map(&:to_sym)
    @points_strategy = PointsStrategy.compute(
      weekdays: weekdays,
      target_range: target,
      year: Time.current.year
    )
  end

  def calculate_strategy
    lessons = params[:semester_goal_lessons].to_i
    target = params[:target_points].to_i

    render json: {
      current_points: current_user&.current_points || 0,
      possible: true,
      total_points: target,
      attend_term1: lessons,
      attend_term2: lessons - 2,
      max_points: target + 10
    }
  end
end
