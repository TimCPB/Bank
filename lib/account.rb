# frozen_string_literal: true

require 'transaction'

# this is now the top level class
class Account
  attr_reader :balance, :transaction_history

  def initialize
    @balance = 0
    @transaction_history = []
  end

  def deposit(amount)
    new_balance = @balance + amount
    Transaction.new(amount, new_balance)
  end
end
