require_relative 'test_helper'
require_relative '../lib/invoice_item'

class InvoiceItemTest < Minitest::Test
  def setup
    engine = SalesEngine.new(Fixture.data)
    engine.startup
    @repository = engine.invoice_item_repository
    @invoice_item = @repository.invoice_items.find { |c| c.id == 1 }
  end

  def test_invoice_items_have_correct_attributes
    data = {
            id: "1",
            item_id: "12",
            invoice_id: "8",
            quantity: "22",
            unit_price: "31099",
            created_at: "2012-03-27 14:54:09 UTC",
            updated_at: "2012-03-27 14:54:09 UTC"
            }
    inv_itm = InvoiceItem.new(data, nil)
    assert inv_itm.id
    assert inv_itm.item_id
    assert inv_itm.invoice_id
    assert inv_itm.quantity
    assert inv_itm.created_at
    assert inv_itm.updated_at
  end

  def test_invoice_items_can_find_an_item
    invoice_item = @repository.find_by_id(1)
    assert_equal "Item Sunt Saepe", invoice_item.item.name
  end
end