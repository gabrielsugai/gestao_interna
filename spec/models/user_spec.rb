require 'rails_helper'

RSpec.describe User, type: :model do
  subject { create :user }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
end
