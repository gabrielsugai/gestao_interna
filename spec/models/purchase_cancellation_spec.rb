require 'rails_helper'

RSpec.describe PurchaseCancellation, type: :model do
  let!(:subject) { create :purchase_cancellation }

  it 'has relations' do
    expect(subject).to respond_to(:user)
    expect(subject).to respond_to(:purchase)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  context 'method: approve!' do
    it 'approves a cancellation request' do
      user = create :user
      subject.approve!(user)

      expect(subject.status).to eq('approved')
      expect(subject.user).to eq(user)
    end

    it 'deactivates an purchase' do
      user = create :user
      subject.approve!(user)

      expect(subject.purchase.status).to eq('inactive')
    end
  end

  context 'method: reject!' do
    it 'rejects a cancellation request' do
      user = create :user
      subject.reject!(user)

      expect(subject.status).to eq('rejected')
      expect(subject.user).to eq(user)
    end

    it 'does not deactivate an purchase' do
      user = create :user
      subject.reject!(user)

      expect(subject.purchase.status).to eq('active')
    end
  end
end
