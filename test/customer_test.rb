require_relative 'test_helper'
require_relative '../lib/customer'

class CustomerTest < Minitest::Test

  def test_it_has_correct_attributes
    data = {
           id: "1",
           first_name: "Kit",
           last_name: "Pearson",
           created_at: "2012-03-27 14:54:09 UTC",
           updated_at: "2012-03-27 14:54:09 UTC"
           }
    customer = Customer.new(data)
    assert_equal "Kit", customer.first_name
  end
end
