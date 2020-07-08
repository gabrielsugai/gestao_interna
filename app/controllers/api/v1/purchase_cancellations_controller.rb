class Api::V1::PurchaseCancellationsController < Api::V1::ApiController
  def create
    purchase = Purchase.find_by!(token: params[:purchase][:token])
    PurchaseCancellation.create!(purchase: purchase, reason: params[:reason])

    head :no_content
  end
end
