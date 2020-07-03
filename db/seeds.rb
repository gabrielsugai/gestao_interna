require 'faker'

User.create(email: 'teste@gestao.com.br', password: '123456')

FactoryBot.create_list :plan, 5
FactoryBot.create_list :plan, 2, :inactive
