class PointsStrategy
  WEEKDAY_INDEXES = { sunday: 0, monday: 1, tuesday: 2, wednesday: 3, thursday: 4, friday: 5, saturday: 6 }.freeze

  def self.compute(user:, target_points:, target_range:, semester_goal_lessons: nil)
    # ✅ PRIORITY: params > DB > default
    lessons = semester_goal_lessons || user.semester_goal_lessons || 10
    weekdays = user.schedule_days.pluck(:day_of_week).map(&:to_sym)

    chosen_wdays = weekdays.map { |w| WEEKDAY_INDEXES.fetch(w) }
    count_lessons = ->(from, to) { (from..to).count { |d| chosen_wdays.include?(d.wday) } }

    # Academic year dates
    max_term1 = count_lessons.call(Date.new(2025, 10, 1), Date.new(2025, 12, 28))
    max_term2 = count_lessons.call(Date.new(2026, 2, 1), Date.new(2026, 5, 31))

    # YOUR LOGIC: Fixed Term1 → compute Term2
    attend_term1 = [lessons, max_term1].min
    points_term1 = attend_term1 * 4
    remaining = [target_points - points_term1, 0].max
    attend_term2 = (remaining.to_f / 3).ceil.clamp(0, max_term2)

    total_points = attend_term1 * 4 + attend_term2 * 3
    max_possible = max_term1 * 4 + max_term2 * 3

    result = {
      attend_term1: attend_term1,
      attend_term2: attend_term2,
      total_points: total_points,
      current_points: user.current_points || 0
    }

    result.merge(
      possible: total_points >= target_points && total_points >= target_range.begin,
      max_points: max_possible.round(-1)
    )
  end
end
