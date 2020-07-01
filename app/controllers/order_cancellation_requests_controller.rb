class OrderCancellationRequestsController < ApplicationController

  def index
    @cancellation_requests = OrderCancellationRequest.where(status: 'open')
  end
end