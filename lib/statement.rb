# frozen_string_literal: true

require 'transaction'

class Statement # :nodoc:
  attr_reader :transaction_array

  def initialize(transaction_array)
    @transaction_array = transaction_array
  end

  def generate_statement
    array = @transaction_array.map do |transaction|
      if transaction.type == 'deposit'
        "#{transaction.date} || #{transaction.amount} || || #{transaction.new_balance}"
      else
        "#{transaction.date} || || #{transaction.amount} || #{transaction.new_balance}"
      end
    end
    "date || credit || debit || balance\n" + array.join("\n")
  end
end
