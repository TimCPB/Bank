# frozen_string_literal: true

require 'transaction'

describe Transaction do
  context 'a new transaction is created with a deposit of £20' do
    transaction = Transaction.new(20, 40)

    it 'initializes with an amount' do
      expect(transaction.amount).to eq(20)
    end

    it 'initializes with a new balance' do
      expect(transaction.new_balance).to eq(40)
    end

    it "initializes with a default type of 'deposit'" do
      expect(transaction.type).to eq('deposit')
    end
  end

  it "contains the date in 'day/month/year' format" do
    allow(Time).to receive(:now).and_return Time.new(2020, 2, 3)
    transaction = Transaction.new(30, 50) # repeating line 7, needs to be DRY-ed out
    expect(transaction.date).to eq('03/02/2020')
  end
end
