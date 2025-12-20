class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :login
      t.string :password_digest
      t.integer :target_points
      t.integer :current_points

      t.timestamps
    end
  end
end
