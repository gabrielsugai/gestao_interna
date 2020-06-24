class PlansController < ApplicationController
  def index
  end

  def show
    @plan = Plan.find(params[:id])
  end

  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(plan_params)
    if @plan.save
      flash[:notice] = 'Successfully!'
      redirect_to @plan
    else
      flash[:notice]
      render :new
    end
  end

  private

  def plan_params
    params.require(:plan).permit( :name, :price, :platforms, :limit_daily_chat, :limit_monthly_chat, :limit_daily_messages, :limit_monthly_messages, :extra_message_price, :extra_chat_price)
  end
end
