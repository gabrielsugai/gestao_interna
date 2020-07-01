require 'rails_helper'

feature 'system start bot' do
  scenario 'succesfully' do
    log_user_in!
    company = create(:company)
    plan = create(:plan)
    order = Order.create(company: company, plan: plan)
    newbot = Bot.create(order: order, company: order.company)

    visit root_path
    click_on 'Bots'

    expect(page).to have_content(newbot.company.name)
    expect(page).to have_content(newbot.order.plan.name)
    expect(page).to have_content('Ativo')
    expect(page).to have_content(newbot.token)
  end

  scenario 'show all bots' do
    log_user_in!
    create(:bot, status: 5)
    create(:bot, status: 10)
    create(:bot)
    visit bots_path

    expect(page).to have_content('Cancelado')
    expect(page).to have_content('Bloqueado')
    expect(page).to have_content('Ativo')
  end

  scenario 'there isn\'t bots created' do
    log_user_in!

    visit bots_path

    expect(page).to have_content('Ainda não foi criado nenhum bot!')
  end
end
