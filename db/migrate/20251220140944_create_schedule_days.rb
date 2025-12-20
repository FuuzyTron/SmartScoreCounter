class CreateScheduleDays < ActiveRecord::Migration[8.1]
  def change
    create_table :schedule_days do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :day_of_week

      t.timestamps
    end
  end
end
