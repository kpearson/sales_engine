require_relative 'test_helper'
require_relative '../lib/customer_manager'

class CustomersTest < Minitest::Test
  def test_customers_file
    assert CustomerManager.new(data)
  end

  def test_customers_load
    skip
    customer = CustomerManager.new(data)
    assert customer.load
  end

  def test_customers_all
    skip
    customer = CustomerManager.new(data)
    assert_equal 8, customer.all.count
  end

  def test_find_by
    skip
    customer = CustomerManager.new(data)
    customer.find_by(id, 1)
    assert_equal 1, customer.id
  end

end