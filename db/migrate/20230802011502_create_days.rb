class CreateDays < ActiveRecord::Migration[6.1]
  def change
    create_table :days do |t|
      t.integer :plan_id
      t.integer :number

      t.timestamps
    end
  end
end
