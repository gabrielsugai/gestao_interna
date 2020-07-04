class Api::V1::OrdersController < Api::V1::ApiController
  before_action :check_company, :check_plan

  def create
    @order = Order.create(company: @company, plan: @plan, price: @price)
    render json: @order, include: %i[company plan], status: :ok
  end

  private

  def check_company
    @company = Company.find_by!(token: params[:order][:company_token])
  rescue ActiveRecord::RecordNotFound
    render status: :ok,
            json: {
              error: t('.error', attribute: t('.token'))
            }
  end

  def check_plan
    @plan = Plan.find(params[:order][:plan_id])
    # @price = params[:order][:price].nil? ? @plan.price : params[:order][:price]
    @price = params[:order][:price] || @plan.price
  rescue ActiveRecord::RecordNotFound
    render status: :ok,
            json: {
              error: t('.error', attribute: t('.plan'))
            }
  end
end
