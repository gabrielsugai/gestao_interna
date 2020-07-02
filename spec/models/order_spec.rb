require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'company cannot be blank' do
    order = Order.new

    order.valid?

    expect(order.errors[:company]).to include('é obrigatório(a)')
  end

  it 'plan cannot be blank' do
    company = create(:company)
    order = Order.new(company: company)

    order.valid?

    expect(order.errors[:plan]).to include('é obrigatório(a)')
  end
end
