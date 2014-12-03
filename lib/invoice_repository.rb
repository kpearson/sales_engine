require 'csv'
require_relative 'invoice'

class InvoicesRepository
  attr_reader :invoices, :engine

  def initialize(data, parent)
    @invoices = invoices_data(data)
    @engine    = parent
  end

  def invoices_data(data)
    data.map do |row|
      Invoice.new(row, self)
    end
  end

  def inspect
    "<#{self.class} #{@invoices.size} rows>"
  end

  def all
    invoices
  end

  def random
    invoices.sample
  end

  def find_by_id(id)
    invoices.find do |invoice|
      invoice.id == id
    end
  end

  def find_all_by_customer_id(customer_id)
    invoices.find_all do |invoice|
      invoice.customer_id == customer_id
    end
  end

  def find_all_by_merchant_id(merchant_id)
    invoices.find_all do |invoice|
      invoice.merchant_id == merchant_id
    end
  end

  def find_by_status(status)
    invoices.find_all do |invoice|
      invoice.status == status
    end
  end

  def transactions(invoice_id)
    engine.invoice_transactions(invoice_id)
  end

  def find_customer_by(customer_id)
    engine.customer_by(customer_id)
  end

  def invoice_items(invoice_id)
    engine.invoice_items_belonging_to_invoice(invoice_id)
  end
end
