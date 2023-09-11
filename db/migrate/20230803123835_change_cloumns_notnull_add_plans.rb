class ChangeCloumnsNotnullAddPlans < ActiveRecord::Migration[6.1]
  def change
    change_column :plans, :plan_status, :boolean, null: false
  end
end
