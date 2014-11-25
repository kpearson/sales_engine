require_relative 'test_helper'
require_relative '../lib/customer_data'

class CustomersTest < Minitest::Test
  def test_customers_file
    assert CustomerData.new
  end

  def test_customers_load
    customer = CustomerData.new
    assert customer.load
  end

end