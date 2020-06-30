require 'rails_helper'

describe 'Register Order' do
  context 'POST api/v1/orders' do
    it 'receive order' do
      plan = create(:plan, name: 'Plano Top', price: 20)
      company = create(:company, token: '12345', name: 'Empresa A')
      
      post '/api/v1/orders', params: { order: { company_token: company.token, plan_id: plan.id, price: plan.price } }

      expect(response).to have_http_status(:ok)
      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(JSON.parse(response.body)['company']).to eq (company)
      expect(JSON.parse(response.body)['plan_id']).to eq (plan.id)
      expect(JSON.parse(response.body)['price']).to eq (plan.price)
    end

  #   it 'successfully' do
  #     plan = create(:plan, name: 'Plano Top', price: 20)
  #     company = create(:company, token: '12345', name: 'Empresa A')
  #     # order = company: company, plan: plan, price: 20, email: company.email

  #     get api_v1_order_path

  #     expect(response).to have_http_status(:ok)
  #     expect(response.content_type).to eq('application/json')
  #     expect(response.body).to include bot.company.name
  #     expect(response.body).to include bot.plan.name
  #     expect(response.body).to include bot.plan.price
  #   end

  end
end