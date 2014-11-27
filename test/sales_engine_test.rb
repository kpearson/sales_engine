require_relative 'test_helper'

class SalesEngineTest < Minitest::Test
  def setup
    @test_data = "./test/fixtures/customers.csv"
    @engine = SalesEngine.new
  end

  def test_sales_engine_startup
    assert @engine.startup(@test_data)
  end

  def test_sales_engine_sees_customers
    @engine.startup(@test_data)
    assert @engine.customer_repository
  end
end