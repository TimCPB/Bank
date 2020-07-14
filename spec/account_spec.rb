# frozen_string_literal: true

require 'account'

describe Account do
  context 'a new account is set up' do
    account = Account.new

    it 'exists (can be initialized)' do
      expect(account).to be
    end

    it 'initializes with a balance of 0' do
      expect(account.balance). to eq(0)
    end

    it 'receives a deposit' do
      expect(account).to respond_to(:deposit).with(1).argument
    end
  end
end
