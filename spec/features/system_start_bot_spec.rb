require 'rails_helper'

feature 'system start bot' do
  scenario 'succesfully' do
    user = create(:user)
    login_as user 
    company = create(:company)
    plan = create(:plan)
    order = Order.create(company: company, plan: plan)
    newbot = Bot.create(order: order, company: order.company)

    visit root_path
    click_on 'Bots'

    expect(page).to have_content(newbot.company.name)
    expect(page).to have_content(newbot.order.plan.name)
    expect(page).to have_content(newbot.status)
    expect(page).to have_content(newbot.token)
  end
end