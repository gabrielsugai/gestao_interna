require 'faker'

User.create(email: 'teste@gestao.com.br', password: '123456')

FactoryBot.create_list :plan, 5

FactoryBot.create_list :company, 5

FactoryBot.create_list :order, 5
FactoryBot.create_list :order_cancellation_request, 5
