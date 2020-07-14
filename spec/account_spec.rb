# frozen_string_literal: true

require 'account'

describe Account do
  let(:account) { Account.new }

  it 'exists (can be initialized)' do
    expect(account).to be
  end

  it 'initializes with a balance of 0' do
    expect(account.balance). to eq(0)
  end

  it 'receives a deposit' do
    expect(account).to respond_to(:deposit).with(1).argument
  end

  it 'records the transaction history' do
    expect(account.transaction_history).to eq([])
  end

  it 'depositing an amount creates a new instance of Transaction class' do
    expect(account.deposit(20)).to be_instance_of(Transaction)
  end

  it 'shows a total balance after multiple deposits' do
    account.deposit(20)
    account.deposit(30)
    expect(account.balance).to eq(50)
  end
end
