require 'rails_helper'

VALID_TOKEN_REGEX = /[0-9A-Z]{6}/.freeze

RSpec.describe Purchase, type: :model do
  let!(:subject) { create :purchase }

  it 'has relations' do
    expect(subject).to respond_to(:plan)
    expect(subject).to respond_to(:cancellation_requests)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  context 'token' do
    it 'should generate a token when created' do
      subject.save

      expect(subject.token).to match VALID_TOKEN_REGEX
    end

    it 'should generate an unique token' do
      another_purchase = create(:purchase)
      allow(SecureRandom).to receive(:alphanumeric).and_return(another_purchase.token, 'ABC123')
      subject.save

      expect(subject.token).not_to eq(another_purchase.token)
    end
  end
end
