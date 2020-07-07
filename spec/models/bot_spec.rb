require 'rails_helper'

RSpec.describe Bot, type: :model do
  subject { create :bot }

  it 'has relations' do
    expect(subject).to belong_to(:company)
    expect(subject).to belong_to(:purchase)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  context 'token' do
    it 'should generate a token on create' do
      expect(subject.token).to match RegexSupport::VALID_TOKEN_REGEX
    end

    it 'token must be unique' do
      bot = build(:bot)
      allow(SecureRandom).to receive(:alphanumeric).and_return(subject.token, 'ABC123')
      bot.save
      expect(bot.token).not_to eq(subject.token)
    end
  end
end
