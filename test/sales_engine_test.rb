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

  def test_engine_can_create_merchants_repo
    @engine.startup(fixture_data)
    assert @engine.merchants
  end

  def test_engine_can_create_invoice_repo
    @engine.startup(fixture_data)
    assert @engine.invoices
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