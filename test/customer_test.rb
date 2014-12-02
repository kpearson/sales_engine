require_relative 'test_helper'
require_relative '../lib/customer'

class CustomerTest < Minitest::Test

  def test_it_has_correct_attributes
    data = {
           id: "1",
           first_name: "Joey",
           last_name: "Pearson",
           created_at: "2012-03-27 14:54:09 UTC",
           updated_at: "2012-03-27 14:54:09 UTC"
           }
    customer = Customer.new(data, nil)
    assert_equal "Joey", customer.first_name
  end

  def test_customer_can_find_its_invoices
    engine = SalesEngine.new
    engine.startup(fixture_data)
    customer = engine.customers.find_by_id(1)
    assert_equal 8, customer.invoices
  end

  def fixture_data
    {
    :items_data         => "./test/fixtures/items.csv",
    :invoices_data      => "./test/fixtures/invoices.csv",
    :customers_data     => "./test/fixtures/customers.csv",
    :merchants_data     => "./test/fixtures/merchants.csv",
    :transactions_data  => "./test/fixtures/transactions.csv",
    :invoice_items_data => "./test/fixtures/invoice_items.csv"
    }
  end
end