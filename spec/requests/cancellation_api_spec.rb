require 'rails_helper'

describe 'Order cancellation' do
  context 'POST /api/v1/order/:id/cancel' do
    it 'Should cancel' do
      order = create(:order)

      post cancel_api_v1_order_path(order)

      expect(response).to have_http_status(:ok)
      expect(order.cancellation_requests.count).to eq(1)
      
    end
  end
end