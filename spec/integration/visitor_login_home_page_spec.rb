require 'rails_helper'

feature 'Visitor log-in from home page' do
  scenario 'succesfully' do
    create(:user, email: 'user@test.com.br', password: '1234567')

    visit root_path

    expect(current_path).to eq(new_user_session_path)
    fill_in 'Email', with: 'user@test.com.br'
    fill_in 'Senha', with: '1234567'
    click_on 'Entrar'

    expect(current_path).to eq(root_path)
    expect(page).to have_content('Login efetuado com sucesso')
    expect(page).to have_content('Bem vindo ao sistema de gerenciamento de Bots!')
  end
end
