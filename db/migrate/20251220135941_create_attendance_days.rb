class CreateAttendanceDays < ActiveRecord::Migration[8.1]
  def change
    create_table :attendance_days do |t|
      t.references :user, null: false, foreign_key: true
      t.date :day

      t.timestamps
    end
  end
end
