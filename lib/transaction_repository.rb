require 'csv'
require_relative 'transaction'

class TransactionRepository
  attr_reader :transactions, :engine

  def initialize(data, parent)
    @transactions = transaction_data(data)
    @engine       = parent
  end

  def transaction_data(data)
    data.map do |row|
      Transaction.new(row, self)
    end
  end

  def inspect
    "<#{self.class} #{@items.size} rows>"
  end

  def all
    transactions
  end

  def random
    transactions.sample
  end

  def find_by_id(id)
    transactions.find do |transaction|
      transaction.id == id
    end
  end

  def find_invoice_by(invoice_id)
    engine.invoice_by(invoice_id)
  end

  def find_all_by_invoice(invoice_id)
    transactions.find_all do |transaction|
      transaction.invoice_id == invoice_id
    end
  end

  def find_by_credit_card_number(card_number)
    transactions.find do |transaction|
      transaction.credit_card_number == card_number
    end
  end

  def find_all_by_result(result)
    transactions.find_all do |transaction|
      transaction.result == result
    end
  end

end
