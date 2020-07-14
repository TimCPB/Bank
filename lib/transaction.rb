# frozen_string_literal: true

class Transaction # :nodoc:
  attr_reader :date, :amount, :new_balance, :type

  def initialize(amount, new_balance, type = 'deposit')
    @date = Time.now.strftime('%d/%m/%Y')
    @amount = amount
    @new_balance = new_balance
    @type = type
  end
end
