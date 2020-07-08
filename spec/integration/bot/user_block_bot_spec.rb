require 'rails_helper'

feature 'User block bot' do
  scenario 'successfully' do
    log_user_in!
    bot = create(:bot)

    visit bots_path
    within("ul#bot-model-#{bot.id}") do
      click_on 'Ver detalhes'
    end
    click_on 'Bloquear'
   
    expect(page).to have_content('Aguardando confirmação de bloqueio')
    expect(page).not_to have_content('Bloquear')
  end

end