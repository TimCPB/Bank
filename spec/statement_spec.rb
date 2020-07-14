# frozen_string_literal: true

require 'statement'
require 'transaction'

describe Statement do
  let(:time) { Time.new(2020, 2, 3) }

  # allow(Time).to receive(:now).and_return Time.new(2020, 2, 3)
  let(:transaction1) { Transaction.new(20, 20) }
  let(:transaction_array) { [transaction1, Transaction.new(30, 50), Transaction.new(10, 40, 'withdrawl')] }
  let(:statement) { Statement.new(transaction_array) }
  # transaction_array = [Transaction.new(20, 20), Transaction.new(30, 50), Transaction.new(10, 40, 'withdrawl')]

  # it 'takes an argument upon intialization' do
  #   expect(subject).to respond_to(:initialize)
  # end

  it 'stores an array of transaction instances upon instantiation' do
    p statement.transaction_array[1].date
    expect(statement.transaction_array[1]).to be_instance_of(Transaction)
    expect(statement.transaction_array.length).to eq(3)
  end

  it 'prints a string for each element of @transaction_array' do
    expect(statement.generate_statement).to include('date || credit || debit || balance',
                                                    '14/07/2020 || || 10.00 || 40.00',
                                                    '14/07/2020 || 30.00 || || 50.00')
  end

  it 'prints the transactions in reverse order' do
    expect(statement.generate_statement).to end_with '20.00'
  end
end
