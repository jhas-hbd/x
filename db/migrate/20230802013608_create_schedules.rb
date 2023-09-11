class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.integer :day_id
      t.time :start_at
      t.time :finished_at
      t.string :place
      t.text :comment
      t.integer :cost
      t.integer :transportation, default: 0
      t.integer :transfer_time
      t.integer :expense

      t.timestamps
    end
  end
end
