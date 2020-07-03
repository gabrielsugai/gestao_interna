require 'rails_helper'

feature 'User can browse plans' do
  scenario 'successfully' do
    log_user_in!
    active_plan = create(:plan, price: 100)
    inactive_plan = create(:plan, :inactive, price: 77.63)

    visit root_path
    click_on 'Planos'

    expect(page).to have_content(active_plan.name)
    expect(page).to have_content('R$ 100,00')
    expect(page).to have_content('Inativo')

    expect(page).to have_content(inactive_plan.name)
    expect(page).to have_content('R$ 77,63')
    expect(page).to have_content('Ativo')
  end
end
