class User < ApplicationRecord
  has_secure_password

  has_many :schedule_days, dependent: :destroy

  validates :name,  presence: true
  validates :login, presence: true, uniqueness: true

  validates :semester_goal_lessons, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
  validates :target_points,  numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
  validates :current_points, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
end
