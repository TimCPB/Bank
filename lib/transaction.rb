# frozen_string_literal: true

class Transaction # :nodoc:
  attr_reader :date, :amount, :new_balance, :type

  def initialize(amount, new_balance, type = 'deposit')
    @date = format_time(Time.now)
    @amount = format(amount)
    @new_balance = format(new_balance)
    @type = type
  end

  private

  def format(number)
    '%.2f' % number
  end

  def format_time(time)
    time.strftime('%d/%m/%Y')
  end
end
