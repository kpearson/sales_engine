require_relative 'test_helper'

class SalesEngineTest < Minitest::Test
  include Fixture
  def setup
    @engine = SalesEngine.new(Fixture.data)
  end

  def test_sales_engine_startup
    assert @engine.startup
  end

  def test_sales_engine_create_customers
    @engine.startup
    assert @engine.customer_repository
  end

  def test_engine_can_create_items_repo
    @engine.startup
    assert @engine.item_repository
  end

  def test_engine_can_create_incvoice_items_repo
    @engine.startup
    assert @engine.invoice_item_repository
  end

  def test_engine_can_create_merchants_repo
    @engine.startup
    assert @engine.merchant_repository
  end

  def test_engine_can_create_invoice_repo
    @engine.startup
    assert @engine.invoice_repository
  end
end