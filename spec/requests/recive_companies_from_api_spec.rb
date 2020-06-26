require 'rails_helper'

describe 'Recive companies' do
  it 'successfully' do
    company_params = { name: 'TreinaDev', cnpj: '68.216.127/0001-86', address: 'Paulista, 450',
                       corporate_name: 'CampusCode' }

    post api_v1_companies_path, params: company_params

    json_response = JSON.parse(response.body, symbolize_names: true)
    expect(response).to have_http_status(:created)
    expect(json_response[:name]).to eq('TreinaDev')
    expect(json_response[:cnpj]).to eq('68.216.127/0001-86')
    expect(json_response[:address]).to eq('Paulista, 450')
    expect(json_response[:corporate_name]).to eq('CampusCode')
    expect(json_response[:token].length).to eq(6)
  end

  it 'CNPJ must be uniq' do
    create(:company, cnpj: '22.927.293/0001-90')
    company_params = { name: 'TreinaDev', cnpj: '22.927.293/0001-90', address: 'Paulista, 450',
                       corporate_name: 'CampusCode' }

    post api_v1_companies_path, params: company_params

    json_response = JSON.parse(response.body, symbolize_names: true)
    expect(response).to have_http_status(:not_acceptable)
    expect(json_response[:error]).to include 'CNPJ já está em uso'
  end

  it 'blank datas' do
    company_params = {}

    post api_v1_companies_path, params: company_params
    json_response = JSON.parse(response.body, symbolize_names: true)
    expect(response).to have_http_status(:not_acceptable)
    expect(json_response[:error]).to include 'CNPJ não pode ficar em branco'
    expect(json_response[:error]).to include 'Nome não pode ficar em branco'
    expect(json_response[:error]).to include 'Razão social não pode ficar em branco'
    expect(json_response[:error]).to include 'Endereço não pode ficar em branco'
  end

  it 'cnpj must be valid' do
    company_params = { name: 'TreinaDev', cnpj: '00.000.000/0000-90', address: 'Paulista, 450',
                       corporate_name: 'CampusCode' }

    post api_v1_companies_path, params: company_params

    json_response = JSON.parse(response.body, symbolize_names: true)
    expect(response).to have_http_status(:not_acceptable)
    expect(json_response[:error]).to include 'CNPJ não é válido'
  end
end
