require 'csv'
require_relative 'invoice'

class InvoicesRepository
  attr_reader :invoices

  def initialize(file_name, parent)
    @invoices = invoices_data(file_name)
    @engine    = parent
  end

  def invoices_data(file_name)
    csv = CSV.open("#{file_name}",
      headers: true, header_converters: :symbol)
    csv.map do |row|
      Invoice.new(row, self)
    end
  end

  def inspect
    "<#{self.class} #{@items.size} rows>"
  end

  def all
    invoices
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

  def find_by_merchant_id(merchant_id)
    invoices.find do |invoice|
      invoice.merchant_id == merchant_id
    end
  end

  def find_by_status(status)
    invoices.find_all do |invoice|
      invoice.status == status
    end
  end
end
