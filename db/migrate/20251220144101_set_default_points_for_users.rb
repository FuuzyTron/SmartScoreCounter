class SetDefaultPointsForUsers < ActiveRecord::Migration[8.0]
  def change
    change_column_default :users, :target_points, from: nil, to: 60
    change_column_default :users, :current_points, from: nil, to: 0

    change_column_null :users, :target_points, false, 60
    change_column_null :users, :current_points, false, 0
  end
end
