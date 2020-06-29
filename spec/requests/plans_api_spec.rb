require 'rails_helper'

describe 'Plan management' do
  context 'GET /api/v1/plans' do
    it 'returns all plans' do
      plans = create_list(:plan, 5)

      get api_v1_plans_path

      json_response = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:ok)
      expect(json_response[0][:name]).to eq(plans.first.name)
      expect(json_response[0][:price]).to eq(plans.first.price)

      expect(json_response[1][:name]).to eq(plans.second.name)
      expect(json_response[1][:price]).to eq(plans.second.price)

      expect(json_response[2][:name]).to eq(plans.third.name)
      expect(json_response[2][:price]).to eq(plans.third.price)

      expect(response.body).to include(plans.last.price.to_s)
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
      expect(json_response[:price]).to eq(plan.price)

      expect(response.body).to include(plan.price.to_s)
    end

    it 'returns not found' do
      get api_v1_plan_path(1)

      expect(response).to have_http_status(:not_found)

      json_response = JSON.parse(response.body, symbolize_names: true)
      expect(json_response[:error]).to eq 'Plano não encontrado.'
    end
  end
end
