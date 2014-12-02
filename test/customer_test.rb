require_relative 'test_helper'
require_relative '../lib/customer'

class CustomerTest < Minitest::Test
  include Fixture

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
    engine.startup(Fixture::DATA)
    repository = engine.customers_repository
    customer = repository.customers.find { |c| c.id == "1" }
    assert_equal 8, customer.invoices.count
  end
end