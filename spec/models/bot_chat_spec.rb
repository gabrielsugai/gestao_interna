require 'rails_helper'

RSpec.describe BotChat, type: :model do
  subject { create :bot_chat }

  it 'has relations' do
    expect(subject).to belong_to(:bot)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'validates mandatory attributes' do
    expect(subject).to validate_presence_of(:external_token)
    expect(subject).to validate_presence_of(:start_time)
    expect(subject).to validate_presence_of(:platform)
    expect(subject).to validate_presence_of(:bot)
  end

  it 'validates unique attributes' do
    expect(subject).to validate_uniqueness_of(:external_token)
  end

  context 'start_time' do
    it 'must be in the past' do
      subject.start_time = 1.hour.from_now

      expect(subject).to_not be_valid
      expect(subject.errors[:start_time]).to include('não pode ser no futuro.')
    end
  end

  context 'end_time' do
    it 'must be after start_time' do
      subject.start_time = 1.hour.ago
      subject.end_time = 2.hours.ago

      expect(subject).to_not be_valid
      expect(subject.errors[:end_time]).to include('deve ser depois do início da conversa.')
    end
  end
end
