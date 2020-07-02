require 'rails_helper'

feature 'User can browse cancellation request' do
  scenario 'and approve one successfuly' do
    user = log_user_in!
    cancellation_requests = create_list(:order_cancellation_request, 3)
    cancellation_request = cancellation_requests.first

    visit root_path

    click_on 'Solicitações de cancelamento'
    within "tr#request-#{cancellation_request.id}" do
      click_on 'Rejeitar'
    end

    cancellation_request.reload
    expect(cancellation_request.status).to eq('rejected')
    expect(cancellation_request.user).to eq(user)
    expect(cancellation_request.order.status).to eq('active')

    expect(current_path).to eq(order_cancellation_requests_path)
    expect(page).to have_content('Solicitação de cancelamento rejeitada!')
    expect(page).not_to have_content(cancellation_request.order.company.name)
    expect(page).not_to have_content(cancellation_request.order.company.token)
    expect(page).not_to have_content(cancellation_request.order.plan.name)
  end
end
