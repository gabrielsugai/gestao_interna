module Api
  module V1
    class OrdersController < ActionController::API
      def cancel
        order = Order.find(params[:id])
        cancellation_request = OrderCancellationRequest.new(order: order)

        if cancellation_request.save
          render json: {}, status: :ok
        else
          open_cancellation_request
        end
      rescue ActiveRecord::RecordNotFound => e
        order_not_found(e)
      end

      private

      def open_cancellation_request
        render status: :bad_request,
               json: {
                 error: I18n.t('controllers.api.v1.errors.open_cancellation_request')
               }
      end

      def order_not_found(error)
        render status: :not_found,
               json: {
                 error: I18n.t('controllers.api.v1.errors.not_found',
                               model: error.model.constantize.model_name.human)
               }
      end
    end
  end
end
