class AddPlanStatusToPlans < ActiveRecord::Migration[6.1]
  def change
    add_column :plans, :plan_status, :boolean, default: false
  end
end
