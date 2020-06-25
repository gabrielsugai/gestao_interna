require 'rails_helper'

describe 'Plan management' do
  context 'GET /api/v1/plans' do
    it 'returns all plans' do
      plans = create_list(:plan, 5)

      get api_v1_plans_path

      json_response = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:ok)
      (0..4).each do |index|
        expect(json_response[index][:name]).to eq(plans[index].name)
        expect(json_response[index][:plan_prices].last[:value]).to eq(plans[index].current_price)
      end
    end

    it 'returns empty array without plans' do
      get api_v1_plans_path

      json_response = JSON.parse(response.body, symbolize_names: true)

      expect(json_response).to be_empty
    end
  end

  context 'GET /api/v1/plans/:id' do
    it 'returns a single plan' do
      plan = create(:plan)

      get api_v1_plan_path(1)

      expect(response).to have_http_status(:ok)

      json_response = JSON.parse(response.body, symbolize_names: true)

      expect(json_response[:name]).to eq(plan.name)
      expect(json_response[:plan_prices].last[:value]).to eq(plan.current_price)

      expect(response.body).to include(plan.current_price.to_s)
    end

    it 'returns not found' do
      get api_v1_plan_path(1)

      expect(response).to have_http_status(:not_found)

      json_response = JSON.parse(response.body, symbolize_names: true)
      expect(json_response[:error]).to eq 'Plano não encontrado.'
    end
  end
end
