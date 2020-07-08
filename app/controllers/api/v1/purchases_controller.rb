class Api::V1::PurchasesController < Api::V1::ApiController
  before_action :check_purchase, :check_plan_purchase, :check_company, :check_plan

  def create
    @purchase = Purchase.create(company: @company, plan: @plan, price: @price)
    render json: @purchase, include: %i[company plan], status: :ok
  end

  private

  def check_company
    @company = Company.find_by!(token: params[:purchase][:company_token])
  end

  def check_plan
    @plan = Plan.find(params[:purchase][:plan_id])
    @price = params[:purchase][:price] || @plan.price
  end

  def check_purchase
    return unless params[:purchase].nil?

    render status: :ok,
           json: {
             error: t('.error', attribute: t('.purchase'))
           }
  end

  def check_plan_purchase
    return unless params[:purchase][:plan_id].nil? && params[:purchase][:company_token].nil?

    render status: :ok,
           json: {
             error: t('.errors')
           }
  end
end
