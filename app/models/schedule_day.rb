class ScheduleDay < ApplicationRecord
  belongs_to :user

  # 1..7 (monday..sunday)
  enum :day_of_week, {
    monday: 1, tuesday: 2, wednesday: 3, thursday: 4, friday: 5, saturday: 6, sunday: 7
  }

  validates :day_of_week, presence: true, uniqueness: { scope: :user_id }
end
