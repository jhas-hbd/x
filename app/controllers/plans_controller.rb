class PlansController < ApplicationController
  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(plan_params)
    @plan.user_id = current_user.id
    if @plan.save
      redirect_to new_plan_day_path(@plan)
    else
      render :new
    end
  end

  def check
    @plan = Plan.find(params[:id])
    @days = @plan.days
  end

  def show
    @plan = Plan.find(params[:id])
    @days = @plan.days
  end

  def edit
    @plan = Plan.find(params[:id])
  end

  def update
    plan = Plan.find(params[:id])
    plan.update(plan_params)
    redirect_to check_plan_path(plan)
  end

  def status
    plan = Plan.find(params[:id])
    days = plan.days
    days.each do |day|
      if (days != nil) && (day.schedules != nil)
        plan.update(plan_status: true)
        flash[:notice] = "投稿しました。"
        redirect_to plans_path
      else
        flash[:notice] = "未入力の欄があります。"
        render :show
      end
    end
  end

  def index
    @plans = Plan.all
  end

  private

  def plan_params
    params.require(:plan).permit(:title, :prefecture, :stay_days, :budget, :main_vehicle, :impression, {plan_images: []})
  end
end
