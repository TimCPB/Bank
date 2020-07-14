# frozen_string_literal: true

class Transaction # :nodoc:
  attr_reader :amount, :new_balance

  def initialize(amount, new_balance)
    @amount = amount
    @new_balance = new_balance
  end
end
