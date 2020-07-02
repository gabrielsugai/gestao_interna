class OrderCancellationRequestsController < ApplicationController
  def index
    @cancellation_requests = OrderCancellationRequest.where(status: 'open')
  end

  def approve
    cancellation_request = OrderCancellationRequest.find(params[:id])
    cancellation_request.approve!(current_user)
    cancellation_request.save

    redirect_to order_cancellation_requests_path,
                success: t('flash.order_cancellation_request.approved')
  end

  def reject
    cancellation_request = OrderCancellationRequest.find(params[:id])
    cancellation_request.reject!(current_user)
    cancellation_request.save

    redirect_to order_cancellation_requests_path,
                success: t('flash.order_cancellation_request.rejected')
  end
end
