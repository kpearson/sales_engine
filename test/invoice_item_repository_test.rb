require 'test_helper'
require_relative '../lib/invoice_item_repository'

class InvoiceItemRepositoryTest < Minitest::Test
  include Fixture
  def setup
    engine = SalesEngine.new(Fixture.data)
    engine.startup
    @invoice_item_repository = engine.invoice_item_repository
  end

  def test_invoice_items_repo_can_load
    assert @invoice_item_repository
  end

  def test_invoice_items_all
    assert_equal 15, @invoice_item_repository.all.count
  end

  def test_invoice_items_random
    invoice_item_1 = @invoice_item_repository.random
    invoice_item_2 = @invoice_item_repository.random
    refute_equal invoice_id_1, invoice_id_2
  end

  def test_invoice_items_find_all_by_item_id
    invoice_items = @invoice_item_repository.find_all_by_item(539)
    assert_equal 1, invoice_items.count
  end

  def test_invoice_items_find_by_item_id
    invoice_item = @invoice_item_repository.find_by_item_id(539)
    assert_equal "$136.35", invoice_item.unit_price
  end

  def test_invoice_items_find_all_by_invoice_id
    invoice_items = @invoice_item_repository.find_all_by_invoice(1)
    assert_equal 8, invoice_items.count
  end

  def test_invoice_items_find_all_by_quantity
    invoice_items = @invoice_item_repository.find_all_by_quantity(5)
    assert_equal 3, invoice_items.count
  end

  def test_invoice_items_find_by_invoice_price
    invoice_item_1 = @invoice_item_repository.find_by_price("$136.35")
    assert_equal 1, invoice_item_1.id
    assert_equal "$136.35", invoice_item_1.unit_price
  end
end
