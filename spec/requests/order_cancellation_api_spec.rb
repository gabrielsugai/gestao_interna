require 'rails_helper'

describe 'Order cancellation' do
  context 'POST /api/v1/order/:id/cancel' do
    it 'should create an order cancellation request' do
      order = create(:order)

      post cancel_api_v1_order_path(order)

      expect(response).to have_http_status(:ok)
      expect(order.cancellation_requests.count).to eq(1)
    end

    it 'should return not found for an invalid order id' do
      post cancel_api_v1_order_path(1)

      json_response = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:not_found)
      expect(json_response[:error]).to eq 'Pedido não encontrado.'
    end

    it 'should return bad request if threre is an open cancellation request' do
      order = create(:order)
      create(:order_cancellation_request, order: order)

      post cancel_api_v1_order_path(order)

      json_response = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(:bad_request)
      expect(order.cancellation_requests.count).to eq(1)
      expect(json_response[:error]).to eq 'Esse pedido já possui uma solicitação de cancelamento em aberto.'
    end
  end
end
