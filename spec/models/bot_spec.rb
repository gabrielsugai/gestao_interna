require 'rails_helper'

RSpec.describe Bot, type: :model do
  it 'token must be unique' do
    first_bot = create(:bot, token: 'ABC123')
    second_bot = build(:bot)
    allow(SecureRandom).to receive(:alphanumeric).and_return(first_bot.token,
                                                             'AAA000')
    second_bot.save

    expect(first_bot.token).not_to eq(second_bot.token)
  end
end
