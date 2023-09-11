class SchedulesController < ApplicationController
  def new
    @schedule = Schedule.new
    @day = Day.find(params[:day_id])
    @schedules = @day.schedules
    @plan = Plan.find(params[:plan_id])
  end

  def create
    day = Day.find(params[:day_id])
    @schedule = Schedule.new(schedule_params)
    @schedule.day_id = day.id
    if @schedule.save
      redirect_to request.referer
    else
      render :new
    end
  end

  def index
    @schedules = Schedule.all
  end

  def edit
    @schedule = Schedule.find(params[:id])
    @day = Day.find(params[:day_id])
    @plan = Plan.find(params[:plan_id])
  end

  def update
    plan = Plan.find(params[:plan_id])
    schedule = Schedule.find(params[:id])
    schedule.update(schedule_params)
    redirect_to check_plan_path(plan)
  end

  def destroy
  end


  private

  def schedule_params
    params.require(:schedule).permit(:start_at, :finished_at, :place, :comment, :cost, :transportation, :transfer_time, :expense)
  end

end
