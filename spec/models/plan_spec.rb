require 'rails_helper'

RSpec.describe Plan, type: :model do
  it 'name must be unique' do
    create(:plan, name: 'Business')
    a = Plan.new(name: 'Business')

    a.valid?

    expect(a.errors[:name]).to include('já está em uso')
  end
end
