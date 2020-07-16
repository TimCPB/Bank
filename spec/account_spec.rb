# frozen_string_literal: true

require 'account'

describe Account do
  let(:account) { Account.new }

  context 'after creating several transactions' do
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

    it 'stores all transactions in the transaction_history' do
      account.deposit(50)
      account.withdraw(20)
      account.deposit(30)
      expect(account.transaction_history.length).to eq(3)
    end

    it 'depositing an amount creates a new instance of Transaction class' do
      account.deposit(50)
      account.withdraw(40)
      expect(account.transaction_history[0]).to be_instance_of(Transaction)
    end

    it 'withdrawing an amount creates a new instance of Transaction class' do
      account.deposit(60)
      account.withdraw(40)
      expect(account.transaction_history[1]).to be_instance_of(Transaction)
    end

    it "making a withdrawal creates an instance of Transaction with the type attribute of 'withdrtawl'" do
      account.deposit(80)
      account.withdraw(30)
      expect(account.transaction_history[1].type).to eq('withdrawal')
    end

    it 'print_statement outputs a statement' do
      account.withdraw(200)
      account.deposit(50)
      expect { account.print_statement }.to output.to_stdout
    end
  end
end
