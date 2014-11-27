require_relative 'test_helper'

class SalesEngineTest < Minitest::Test
  def setup
    @engine = SalesEngine.new
  end

  def test_sales_engine_startup
    assert @engine.startup
  end

  def test_sales_engine_sees_customers
    skip
    @engine.startup(fixture_data[:customers_data])
    assert @engine.customer_repository
  end

  def test_engine_can_create_items_repo
    @engine.startup(fixture_data[:items_data])
    assert @engine.item_repository
  end

  def fixture_data
    {
    :customers_data    => "./test/fixtures/customers.csv",
    :items_data        => "./test/fixtures/items.csv",
    :merchant_data     => "./test/fixtures/merchants.csv",
    :invoice_item_data => "./test/fixtures/invoice_items.csv",
    :invoice_data      => "./test/fixtures/invoices.csv",
    :transaction_data  => "./test/fixtures/transactions.csv"
    }
  end
end