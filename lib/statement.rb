# frozen_string_literal: true

require_relative 'transaction'

class Statement # :nodoc:
  attr_reader :transaction_array

  def initialize(transaction_array)
    @transaction_array = transaction_array
  end

  def generate_statement
    join_with_header(@transaction_array.map { |transaction| generate_string(transaction) })
  end

  private

  def generate_string(transaction)
    if deposit?(transaction.type)
      "#{transaction.date} || #{transaction.amount} || || #{transaction.new_balance}"
    else
      "#{transaction.date} || || #{transaction.amount} || #{transaction.new_balance}"
    end
  end

  def deposit?(type)
    type == 'deposit'
  end

  def join_with_header(array)
    "date || credit || debit || balance\n" + array.join("\n")
  end
end
