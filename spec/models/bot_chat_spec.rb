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
end
