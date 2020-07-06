require 'rails_helper'

describe Company do
  context 'Receving datas' do
    context '#token' do
      it 'should generate a token on create' do
        company = build(:company)

        company.save

        expect(company.token).to_not be_blank
      end

      it 'token must be unique' do
        company = build(:company)
        another_company = create(:company)
        allow(SecureRandom).to receive(:alphanumeric).and_return(another_company.token, 'ABC123')
        company.save
        expect(company.token).not_to eq(another_company.token)
      end
    end

    context '#cnpj' do
      it 'cannot be blank' do
        company = build(:company, cnpj: '')

        company.save

        expect(company.errors[:cnpj]).to include('não pode ficar em branco')
      end

      it 'must be a valid format' do
        company = build(:company, cnpj: '22.97.293/0001-90')
        company.save
        expect(company.errors[:cnpj]).to include('não é válido')
      end

      it 'must be ponctuated' do
        company = build(:company, cnpj: '22927293000190')
        company.save
        expect(company.errors[:cnpj]).to include('não é válido')
      end

      it 'must be unique' do
        create(:company, cnpj: '22.927.293/0001-90')
        company = build(:company, cnpj: '22.927.293/0001-90')
        company.valid?
        expect(company.errors[:cnpj]).to include('já está em uso')
      end
    end

    context 'blank attributes' do
      it 'name cannot be blank' do
        company = build(:company, name: '')

        company.save

        expect(company.errors[:name]).to include('não pode ficar em branco')
      end

      it 'address cannot be blank' do
        company = build(:company, address: '')

        company.save

        expect(company.errors[:address]).to include('não pode ficar em branco')
      end

      it 'corporate name cannot be blank' do
        company = build(:company, corporate_name: '')

        company.save

        expect(company.errors[:corporate_name]).to include('não pode ficar em branco')
      end
    end
  end
end
