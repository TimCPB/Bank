# frozen_string_literal: true

require_relative 'transaction'
require_relative 'statement'

# this is now the top level class
class Account
  attr_reader :balance, :transaction_history

  def initialize
    @balance = 0
    @transaction_history = []
  end

  def deposit(amount)
    add_to_balance(amount)
    @transaction_history.push(Transaction.new(amount, @balance))
  end

  def withdraw(amount)
    deduct_from_balance(amount)
    @transaction_history.push(Transaction.new(amount, @balance, 'withdrawl'))
  end

  def print_statement # This needs separating out
    statement = Statement.new(@transaction_history)
    puts statement.generate_statement
  end

  private

  def add_to_balance(number)
    @balance += number
  end

  def deduct_from_balance(number)
    @balance -= number
  end
end
