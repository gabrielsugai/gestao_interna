require 'rails_helper'

describe 'Register Order' do
  context 'POST api/v1/orders' do
    it 'successfully receive all required params' do
      plan = create(:plan, name: 'Plano Top', price: 20)
      company = create(:company, token: '12345', name: 'Empresa A')

      post '/api/v1/orders', params: { order: { company_token: company.token, plan_id: plan.id } }
      json_response = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:ok)
      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect((json_response[:company][:name])).to eq(company.name)
      expect((json_response[:plan][:name])).to eq(plan.name)
    end

    it 'and must receive plan id' do
      company = create(:company, token: '12345', name: 'Empresa A')

      post '/api/v1/orders', params: { order: { company_token: company.token, plan_id: '', price: 20 } }
      json_response = JSON.parse(response.body, symbolize_names: true)

      expect(json_response[:error]).to eq 'Plano não encontrado.'
    end

    it 'and must receive company token' do
      plan = create(:plan)

      post '/api/v1/orders', params: { order: { company_token: '', plan_id: plan.id, price: plan.price } }
      json_response = JSON.parse(response.body, symbolize_names: true)

      expect(json_response[:error]).to eq 'Empresa não encontrado.'
    end

    it 'must receive order' do
      post '/api/v1/orders', params: {}
      json_response = JSON.parse(response.body, symbolize_names: true)

      expect(json_response[:error]).to eq 'Pedido não encontrado.'
    end

    it 'must receive company token and plan id' do
      post '/api/v1/orders', params: { order: { price: 40 } }
      json_response = JSON.parse(response.body, symbolize_names: true)
      expect(json_response[:error]).to eq 'Token e Plano não encontrados.'
    end
  end
end
