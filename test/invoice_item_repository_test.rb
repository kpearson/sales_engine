require 'test_helper'
require_relative '../lib/invoice_item_repository'

class InvoiceItemRepositoryTest < Minitest::Test
  def setup
    @test_data               = "./test/fixtures/invoice_items.csv"
    @invoice_item_repository = InvoiceItemRepository.new(@test_data)
  end

  def test_invoice_items_repo_can_load
    assert @invoice_item_repository
  end

  def test_invoice_items_all
    assert_equal 15, @invoice_item_repository.all.count
  end

  def test_invoice_items_find_by_id
    invoice_item_1 = @invoice_item_repository.find_by_id("1")
    assert_equal "1", invoice_item_1.id
    assert_equal "5", invoice_item_1.quantity
  end

  def test_invoice_items_find_by_item_id
    invoice_item_1 = @invoice_item_repository.find_by_item_id("539")
    assert_equal "1", invoice_item_1.id
    assert_equal "539", invoice_item_1.item_id
  end

  def test_invoice_items_find_by_invoice_id
    invoice_item_1 = @invoice_item_repository.find_by_invoice_id("1")
    assert_equal "1", invoice_item_1.id
    assert_equal "1", invoice_item_1.invoice_id
  end

  def test_invoice_items_find_by_quantity
    invoice_item_1 = @invoice_item_repository.find_by_quantity("5")
    assert_equal "1", invoice_item_1.id
    assert_equal "5", invoice_item_1.quantity
  end

  def test_invoice_items_find_by_invoice_price
    invoice_item_1 = @invoice_item_repository.find_by_price("13635")
    assert_equal "1", invoice_item_1.id
    assert_equal "13635", invoice_item_1.unit_price
  end
end