# frozen_string_literal: true

require 'account'

describe Account do
  before (:each) do
    allow(Time).to receive(:now).and_return Time.new(2020, 2, 3)
  end
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

  it 'shows a total balance after multiple deposits' do
    account.deposit(20)
    account.deposit(30)
    expect(account.balance).to eq(50)
  end

  it 'shows a total balance after multiple deposits and withdrawls' do
    account.deposit(40)
    account.withdraw(30)
    expect(account.balance).to eq(10)
  end

  context 'after creating several transactions' do
    account2 = Account.new
    account2.deposit(50)
    account2.deposit(30)
    account2.withdraw(40)

    it 'stores all transactions in the transaction_history' do
      expect(account2.transaction_history.length).to eq(3)
    end

    it 'depositing an amount creates a new instance of Transaction class' do
      expect(account2.transaction_history[1]).to be_instance_of(Transaction)
    end

    it 'withdrawing an amount creates a new instance of Transaction class' do
      expect(account2.transaction_history[2]).to be_instance_of(Transaction)
    end

    it "making a withdrawl creates an instance of Transaction with the type attribute of 'withdrtawl'" do
      expect(account2.transaction_history[2].type).to eq('withdrawl')
    end

    it "print_statement outputs a statement" do
      expect { account2.print_statement }.to output.to_stdout
    end

#     it "returns a statement" do
#       expect { account2.print_statement }.to output('date || credit || debit || balance
# 15/07/2020 || || 40.00 || 40.00
# 15/07/2020 || 30.00 || || 80.00
# 15/07/2020 || 50.00 || || 50.00').to_stdout
#     end

  end
end
