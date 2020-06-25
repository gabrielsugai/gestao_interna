require 'rails_helper'

describe 'Recive companies' do
  it 'successfully' do
    company_params = { name: 'TreinaDev', cnpj: '68.216.127/0001-86', address: 'Paulista, 450', corporate_name: 'CampusCode' }

    post api_v1_companies_path, params: company_params

    json_response = JSON.parse(response.body, symbolize_names: true)
    expect(response).to have_http_status(:created)
    expect(json_response[:name]).to eq('TreinaDev')
    expect(json_response[:cnpj]).to eq('68.216.127/0001-86')
    expect(json_response[:address]).to eq('Paulista, 450')
    expect(json_response[:corporate_name]).to eq('CampusCode')
    expect(json_response[:token].length).to eq(6)
  end
end