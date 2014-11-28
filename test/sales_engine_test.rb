require_relative 'test_helper'

class SalesEngineTest < Minitest::Test
  def setup
    @engine = SalesEngine.new
  end

  def test_sales_engine_startup
    assert @engine.startup(fixture_data)
  end

  def test_sales_engine_create_customers
    @engine.startup(fixture_data)
    assert @engine.customers
  end

  def test_engine_can_create_items_repo
    @engine.startup(fixture_data)
    assert @engine.items
  end

  def test_engine_can_create_incvoice_items_repo
    @engine.startup(fixture_data)
    assert @engine.invoice_items
  end

  def fixture_data
    {
    :customers_data     => "./test/fixtures/customers.csv",
    :items_data         => "./test/fixtures/items.csv",
    :merchant_data      => "./test/fixtures/merchants.csv",
    :invoice_items_data => "./test/fixtures/invoice_items.csv",
    :invoice_data       => "./test/fixtures/invoices.csv",
    :transaction_data   => "./test/fixtures/transactions.csv"
    }
  end
end