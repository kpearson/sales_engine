require 'csv'
require_relative 'customer'

class CustomerRepository
  attr_reader :customers

  def initialize(file_name, parent)
    @customers = customer_data(file_name)
    @engine    = parent
  end

  def customer_data(file_path)
    csv = CSV.open("#{file_path}",
          headers: true, header_converters: :symbol)
    csv.map do |row|
      Customer.new(row, self)
    end
  end

  def inspect
    "<#{self.class} #{@customers.size} rows>"
  end

  def all
    customers
  end

  def invoices(customer_id)
    @engine.customer_invoices(customer_id)
  end

  def find_by_id(id)
    customers.find do |customer|
      customer.id == id
    end
  end

  def find_by_last_name(last_name)
    customers.find do |customer|
      customer.last_name == last_name
    end
  end

  def find_by_first_name(first_name)
    customers.find do |customer|
      customer.first_name == first_name
    end
  end
end