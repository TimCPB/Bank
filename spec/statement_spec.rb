# frozen_string_literal: true

require 'statement'
require 'transaction'

describe Statement do
  before(:each) do
    allow(Time).to receive(:now).and_return Time.new(2020, 2, 3)
  end

  let(:transaction_array) { [Transaction.new(20, 20), Transaction.new(30, 50), Transaction.new(10, 40, 'withdrawl')] }
  let(:statement) { Statement.new(transaction_array) }
  let(:time) { Time.new(2020, 2, 3).strftime('%d/%m/%Y') }

  it 'stores an array of transaction instances upon instantiation' do
    expect(statement.transaction_array[1]).to be_instance_of(Transaction)
    expect(statement.transaction_array.length).to eq(3)
  end

  it 'prints a string for each element of @transaction_array' do
    expect(statement.generate_statement).to include('date || credit || debit || balance',
                                                    "#{time} || || 10.00 || 40.00",
                                                    "#{time} || 30.00 || || 50.00")
  end

  it 'prints the transactions in reverse order' do
    expect(statement.generate_statement).to end_with '20.00'
  end
end
