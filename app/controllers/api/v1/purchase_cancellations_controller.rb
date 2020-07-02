module Api
  module V1
    class PurchaseCancellationsController < ActionController::API
      def create
        @purchase = Purchase.find_by(token: params[:purchase][:token])
        return purchase_not_found unless @purchase

        cancellation_request = PurchaseCancellation.new(purchase: @purchase,
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
                 error: I18n.t('api.v1.errors.open_cancellation_request')
               }
      end

      def purchase_not_found
        render status: :not_found,
               json: {
                 error: I18n.t('api.v1.errors.not_found',
                               model: Purchase.model_name.human)
               }
      end
    end
  end
end
