require 'rails_helper'

feature 'User register plan' do
	scenario 'successfully' do
	user = create(:user, email: 'aaa@aaa.com', password: '12345678')
	login_as user, scope: :user
	visit root_path
  
  click_on 'Planos'
	click_on 'Cadastrar novo plano'
	fill_in 'Nome', with: 'Business'
	fill_in 'Valor mensal', with: '99,90'
	fill_in 'Plataformas', with: 'Twitter, Facebook, Whatsapp'
	fill_in 'Conversas por dia', with: '20'
	fill_in 'Conversas por mês', with: '600'
	fill_in 'Mensagens por dia', with: '500'
  fill_in 'Mensagens por mês', with: '5000'
  fill_in 'Valor por mensagem além do limite', with: '0,10'
  fill_in 'Valor por conversa além do limite', with: '0,99'

  expect(page).to have_content('Business')
  expect(page).to have_content('R$ 99,90')
  expect(page).to have_content('Twitter')
  expect(page).to have_content('Facebook')
  expect(page).to have_content('Whatsapp')
  expect(page).to have_content('Conversas/dia: 20')
  expect(page).to have_content('Conversas/mês: 600')
  expect(page).to have_content('Mensagens/dia: 500')
  expect(page).to have_content('Mensagens/mês: 5000')
  expect(page).to have_content('R$ 0,10')
  expect(page).to have_content('R$ 0,99')
  end
end