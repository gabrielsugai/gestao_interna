module Api
  module V1
    class OrdersController < ActionController::API
      def create
        @plan = Plan.find(params[:order][:plan_id])
        @company = Company.find_by(token: params[:order][:company_token])
        @price = params[:order][:price].nil? ? @plan.price : params[:order][:price]
        @order = Order.new(company: @company , plan: @plan, price: @price)
        binding.pry
        if @order.save
          render json: @order, status: :ok
        else

        end

      end
    end

    private

    def order_params
      params.require(:order).permit(:company, :plan_id, :price, :company_email)
    end
  end
end
