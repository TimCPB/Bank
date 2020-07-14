# frozen_string_literal: true

require 'transaction'

describe Transaction do
  context "a new transaction is created with a deposit of £20" do
    transaction = Transaction.new(20, 40)

    it "initializes with an amount and a new balance" do
      expect(transaction.amount).to eq(20)
    end

    it "contains the date in 'day/month/year' format" do
      expect(transaction.date).to eq("14/07/2020")
    end
  end
end
