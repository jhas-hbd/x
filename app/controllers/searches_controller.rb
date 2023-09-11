class SearchesController < ApplicationController
  def search
    @plans = Plan.all
    @plans = @plans.where(prefecture: plan_params[:prefecture]) if plan_params[:prefecture].present?
    @plans = @plans.where(stay_days: plan_params[:stay_days]) if plan_params[:stay_days].present?
    @plans = @plans.where(budget: plan_params[:budget]) if plan_params[:budget].present?
    @plans = @plans.where(main_vehicles: plan_params[:main_vehicle]) if plan_params[:main_vehicle].present?
    @plans = @plans.where('title LIKE(?) or impression LIKE(?)',"%#{plan_params[:key_word]}%","%#{plan_params[:key_word]}%") if plan_params[:key_word].present?
  end


  private

  def plan_params
    params.permit(:prefecture, :stay_days, :budget, :main_vehicle, :title, :impression, :key_word)
  end

end
