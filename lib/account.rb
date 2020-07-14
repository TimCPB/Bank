# frozen_string_literal: true

require_relative 'transaction'

# this is now the top level class
class Account
  attr_reader :balance, :transaction_history

  def initialize
    @balance = 0
    @transaction_history = []
  end

  def deposit(amount)
    set_balance(amount)
    Transaction.new(amount, @balance)
  end

  private 
  
  def set_balance(num)
    @balance += num
  end
end
