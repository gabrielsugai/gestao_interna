require 'rails_helper'

describe 'Order cancellation requests' do
  context 'POST /api/v1/order/:id/cancel' do
    it 'should create an order cancellation request' do
      order = create(:order)

      post api_v1_order_cancellation_requests_path,
           params: { order: { token: order.token } }

      expect(response).to have_http_status(:ok)
      expect(order.cancellation_requests.count).to eq(1)
    end

    it 'should save the reason for cancellation' do
      order = create(:order)

      post api_v1_order_cancellation_requests_path,
           params: { order: { token: order.token },
                     reason: 'Não preciso mais deste serviço.' }

      expect(response).to have_http_status(:ok)
      expect(order.cancellation_requests.count).to eq(1)
      expect(order.cancellation_requests.first.reason).to eq('Não preciso mais deste serviço.')
    end

    it 'should return not found for an invalid order id' do
      post api_v1_order_cancellation_requests_path,
           params: { order: { token: 'AM82CO' } }

      json_response = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:not_found)
      expect(json_response[:error]).to eq 'Pedido não encontrado.'
    end

    it 'should return bad request if threre is an open cancellation request' do
      order = create(:order)
      create(:order_cancellation_request, order: order)

      post api_v1_order_cancellation_requests_path,
           params: { order: { token: order.token } }

      json_response = JSON.parse(response.body, symbolize_names: true)
      expect(response).to have_http_status(:bad_request)
      expect(order.cancellation_requests.count).to eq(1)
      expect(json_response[:error]).to eq 'Esse pedido já possui uma solicitação de cancelamento em aberto.'
    end
  end
end
