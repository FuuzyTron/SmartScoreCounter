class PointsStrategy
  WEEKDAY_INDEXES = {
    sunday:    0,
    monday:    1,
    tuesday:   2,
    wednesday: 3,
    thursday:  4,
    friday:    5,
    saturday:  6
  }.freeze

  def self.compute(weekdays:, target_range:, year:)
    chosen_wdays = weekdays.map { |w| WEEKDAY_INDEXES.fetch(w) }

    count_lessons = lambda do |from_date, to_date|
      (from_date..to_date).count { |d| chosen_wdays.include?(d.wday) }
    end

    term1_start = Date.new(year, 10, 1)
    term1_end   = Date.new(year, 12, 28)
    term2_start = Date.new(year + 1, 2, 1)
    term2_end   = Date.new(year + 1, 5, 31)

    total_term1_days = count_lessons.call(term1_start, term1_end)
    total_term2_days = count_lessons.call(term2_start, term2_end)

    max_points = total_term1_days * 4 + total_term2_days * 3
    return { possible: false, max_points: max_points } if max_points < target_range.begin

    best = nil

    (0..total_term1_days).each do |attend1|
      (0..total_term2_days).each do |attend2|
        points = attend1 * 4 + attend2 * 3
        next if points < target_range.begin

        candidate = {
          attend_term1: attend1,
          attend_term2: attend2,
          total_points: points
        }

        if best.nil? ||
           points < best[:total_points] ||
           (points == best[:total_points] &&
             attend1 + attend2 < best[:attend_term1] + best[:attend_term2])
          best = candidate
        end
      end
    end

    best.merge(possible: true, max_points: max_points)
  end
end
# frozen_string_literal: true

