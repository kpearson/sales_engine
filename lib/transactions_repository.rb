require 'csv'
require_relative 'transaction'

class TransactionsRepository
  attr_reader :transactions

  def initialize(file_name)
    @transactions = transaction_data(file_name)
    # @engine       = parent
  end

  def transaction_data(file_name)
    csv = CSV.open("#{file_name}",
          headers: true, header_converters: :symbol)
    csv.map do |row|
      Transaction.new(row)
    end
  end

  def inspect
    "#<\#{self.class} \#{@items.size} rows>"
  end

  def all
    transactions
  end

  def find_by_id(id)
    transactions.find do |transaction|
      transaction.id == id
    end
  end

  def find_by_invoice_id(invoice_id)
    transactions.find do |transaction|
      transaction.invoice_id == invoice_id
    end
  end

  def find_by_credit_card_number(card_number)
    transactions.find do |transaction|
      transaction.credit_card_number == card_number
    end
  end

  def find_by_transaction_success
    transactions.find_all do |transaction|
      transaction.result == "success"
    end
  end

end