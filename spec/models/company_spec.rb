require 'rails_helper'

RSpec.describe Company, type: :model do
  subject { create :company }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'validates mandatory attributes' do
    expect(subject).to validate_presence_of(:name)
    expect(subject).to validate_presence_of(:address)
    expect(subject).to validate_presence_of(:corporate_name)
    expect(subject).to validate_presence_of(:cnpj)
  end

  context 'token' do
    it 'should generate a token on create' do
      expect(subject.token).to match RegexSupport::VALID_TOKEN_REGEX
    end

    it 'token must be unique' do
      company = build(:company)
      allow(SecureRandom).to receive(:alphanumeric).and_return(subject.token, 'ABC123')
      company.save
      expect(company.token).not_to eq(subject.token)
    end
  end

  context 'cnpj' do
    it 'must be a valid format' do
      subject.cnpj = '22.97.293/0001-90'

      expect(subject).to_not be_valid
      expect(subject.errors[:cnpj]).to include('não é válido')
    end

    it 'must be ponctuated' do
      subject.cnpj = '22927293000190'

      expect(subject).to_not be_valid
      expect(subject.errors[:cnpj]).to include('não é válido')
    end

    it 'must be unique' do
      create(:company, cnpj: '22.927.293/0001-90')
      company = build(:company, cnpj: '22.927.293/0001-90')
      expect(company).to_not be_valid
      expect(company.errors[:cnpj]).to include('já está em uso')
    end
  end
end
