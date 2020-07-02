require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:subject) { create :user }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
end
