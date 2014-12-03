require 'csv'
require_relative 'customer'

class CustomerRepository
  attr_reader :customers

  def initialize(data, parent)
    @customers = customer_data(data)
    @engine    = parent
  end

  def customer_data(data)
    data.map do |row|
      Customer.new(row, self)
    end
  end

  def inspect
    "<#{self.class} #{@customers.size} rows>"
  end

  def all
    customers
  end

  def ramdom
    customers.sample
  end

  def invoices(customer_id)
    customer_id = customer_id
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

  def find_all_by_first_name(first_name)
    customers.find_all do |customer|
      customer.first_name == first_name
    end
  end
end