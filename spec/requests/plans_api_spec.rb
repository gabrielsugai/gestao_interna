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
        expect(json_response[index][:platforms]).to eq(plans[index].platforms)
        expect(json_response[index][:limit_daily_chat]).to eq(plans[index].limit_daily_chat)
        expect(json_response[index][:limit_monthly_chat]).to eq(plans[index].limit_monthly_chat)
        expect(json_response[index][:limit_daily_messages]).to eq(plans[index].limit_daily_messages)
        expect(json_response[index][:limit_monthly_messages]).to eq(plans[index].limit_monthly_messages)
        expect(json_response[index][:extra_message_price]).to eq(plans[index].extra_message_price)
        expect(json_response[index][:extra_chat_price]).to eq(plans[index].extra_chat_price)
        expect(json_response[index][:current_price]).to eq(plans[index].current_price)
      end
    end

    it 'returns empty array without plans' do
      get api_v1_plans_path

      json_response = JSON.parse(response.body, symbolize_names: true)

      expect(json_response).to be_empty
    end

    it 'only return active plans' do
      active_plan = create(:plan)
      create(:plan, :inactive)

      get api_v1_plans_path

      json_response = JSON.parse(response.body, symbolize_names: true)

      expect(json_response.count).to eq(1)
      expect(json_response.first).to include(
        name: active_plan.name,
        platforms: active_plan.platforms,
        limit_daily_chat: active_plan.limit_daily_chat,
        limit_monthly_chat: active_plan.limit_monthly_chat,
        limit_daily_messages: active_plan.limit_daily_messages,
        limit_monthly_messages: active_plan.limit_monthly_messages,
        extra_message_price: active_plan.extra_message_price,
        extra_chat_price: active_plan.extra_chat_price,
        current_price: active_plan.current_price,
        status: 'active'
      )
    end
  end

  context 'GET /api/v1/plans/:id' do
    it 'returns a single plan' do
      plan = create(:plan)

      get api_v1_plan_path(1)

      expect(response).to have_http_status(:ok)

      json_response = JSON.parse(response.body, symbolize_names: true)

      expect(json_response[:name]).to eq(plan.name)
      expect(json_response[:platforms]).to eq(plan.platforms)
      expect(json_response[:limit_daily_chat]).to eq(plan.limit_daily_chat)
      expect(json_response[:limit_monthly_chat]).to eq(plan.limit_monthly_chat)
      expect(json_response[:limit_daily_messages]).to eq(plan.limit_daily_messages)
      expect(json_response[:limit_monthly_messages]).to eq(plan.limit_monthly_messages)
      expect(json_response[:extra_message_price]).to eq(plan.extra_message_price)
      expect(json_response[:extra_chat_price]).to eq(plan.extra_chat_price)
      expect(json_response[:current_price]).to eq(plan.current_price)

      expect(response.body).to include(plan.current_price.to_s)
    end

    it 'returns not found' do
      get api_v1_plan_path(1)

      expect(response).to have_http_status(:not_found)

      json_response = JSON.parse(response.body, symbolize_names: true)
      expect(json_response[:error]).to eq 'Plano não encontrada(o).'
    end
  end
end
