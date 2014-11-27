require_relative 'test_helper'
require_relative '../lib/customer_repository'

class CustomerRepositoryTest < Minitest::Test
  def setup
    @test_data = "./test/fixtures/customers.csv"
    @customer_repository = CustomerRepository.new(@test_data)
  end

  def test_customers_file
    assert @customer_repository
  end

  def test_customers_all
    @customer_repository
    assert_equal 15, @customer_repository.all.count
  end

  def test_find_by_id
    customer_1 = @customer_repository.find_by_id("1")
    assert_equal "1", customer_1.id
    assert_equal "Joey", customer_1.first_name
  end

  def test_find_by_last_name
    customer_3 = @customer_repository.find_by_last_name("Toy")
    assert_equal "Toy", customer_3.last_name
    assert_equal "3", customer_3.id
  end

  def test_find_by_first_name
    customer_7 = @customer_repository.find_by_first_name("Parker")
    assert_equal "Parker", customer_7.first_name
    assert_equal "7", customer_7.id
  end
end