require_relative 'test_helper'
require_relative '../lib/customer_repository'

class CustomerRepositoryTest < Minitest::Test
  include Fixture
  def setup
    engine = SalesEngine.new(Fixture.data)
    engine.startup
    @customer_repository = engine.customer_repository
  end

  def test_customers_file
    assert @customer_repository
  end

  def test_customers_all
    assert_equal 15, @customer_repository.all.count
  end

  def test_customers_random
    skip
    assert_equal
  end

  def test_find_by_id
    customer_1 = @customer_repository.find_by_id(1)
    assert_equal 1, customer_1.id
    assert_equal "Joey", customer_1.first_name
  end

  def test_find_by_last_name
    customer_3 = @customer_repository.find_by_last_name("Toy")
    assert_equal "Toy", customer_3.last_name
    assert_equal 3, customer_3.id
  end

  def test_find_all_by_first_name
    customers = @customer_repository.find_all_by_first_name("Parker")
    assert_equal 2, customers.count
  end

  def test_finds_all_customer_invoices
    customer_1 = @customer_repository.find_by_id(1)
    assert_equal 8, customer_1.invoices.size
  end
end