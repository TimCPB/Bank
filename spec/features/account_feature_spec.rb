# frozen_string_literal: true

require 'account'

describe 'feature test' do
  before(:each) do
    allow(Time).to receive(:now).and_return Time.new(2010, 6, 6)
  end

  let(:account) { Account.new }
  let(:statement) { "date || credit || debit || balance\n06/06/2010 || || 20.00 || 80.00\n06/06/2010 || 100.00 || || 100.00" }

  it 'a user can deposit, withdraw and print a statement' do
    account.deposit(100)
    account.deposit(150)
    account.withdraw(20)
    account.print_statement
    expect { account.print_statement }.to output(/#{statement}/).to_stdout
  end
end
