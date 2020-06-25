require 'rails_helper'

RSpec.describe PlanPrice, type: :model do
  let!(:subject) { create :plan_price }

  it 'has relations' do
    expect(subject).to respond_to(:plan)
  end
end
