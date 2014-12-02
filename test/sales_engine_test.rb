require_relative 'test_helper'

class SalesEngineTest < Minitest::Test
  include Fixture
  def setup
    @engine = SalesEngine.new
  end

  def test_sales_engine_startup
    assert @engine.startup(Fixture::DATA)
  end

  def test_sales_engine_create_customers
    @engine.startup(Fixture::DATA)
    assert @engine.customers_repository
  end

  def test_engine_can_create_items_repo
    @engine.startup(Fixture::DATA)
    assert @engine.items_repository
  end

  def test_engine_can_create_incvoice_items_repo
    @engine.startup(Fixture::DATA)
    assert @engine.invoice_items_repository
  end

  def test_engine_can_create_merchants_repo
    @engine.startup(Fixture::DATA)
    assert @engine.merchants_repository
  end

  def test_engine_can_create_invoice_repo
    @engine.startup(Fixture::DATA)
    assert @engine.invoices_repository
  end
end