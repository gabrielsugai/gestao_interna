module Api
  module V1
    class OrderCancellationRequestsController < ActionController::API
      def create
        @order = Order.find_by(token: params[:order][:token])
        return order_not_found unless @order

        cancellation_request = OrderCancellationRequest.new(order: @order,
                                                            reason: params[:reason])

        if cancellation_request.save
          render json: {}, status: :ok
        else
          open_cancellation_request
        end
      end

      private

      def open_cancellation_request
        render status: :bad_request,
               json: {
                 error: I18n.t('controllers.api.v1.errors.open_cancellation_request')
               }
      end

      def order_not_found
        render status: :not_found,
               json: {
                 error: I18n.t('controllers.api.v1.errors.not_found',
                               model: Order.model_name.human)
               }
      end
    end
  end
end
