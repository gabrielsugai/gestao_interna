class Api::V1::PurchaseCancellationsController < Api::V1::ApiController
  def create
    @purchase = Purchase.find_by!(token: params[:purchase][:token])

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
end
