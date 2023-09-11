class ChangeCloumnsNotnullAddSchedules < ActiveRecord::Migration[6.1]
  def change
    change_column :schedules, :day_id, :integer, null: false
    change_column :schedules, :start_at, :time, null: false
    change_column :schedules, :finished_at, :time, null: false
    change_column :schedules, :place, :string, null: false
    change_column :schedules, :comment, :text, null: false
    change_column :schedules, :cost, :integer, null: false
    change_column :schedules, :transportation, :integer, null: false
    change_column :schedules, :transfer_time, :integer, null: false
    change_column :schedules, :expense, :integer, null: false
  end
end
