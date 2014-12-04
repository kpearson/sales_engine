require_relative 'test_helper'
require_relative '../lib/item'

class ItemTest < Minitest::Test
  def setup
    engine = SalesEngine.new(Fixture.data)
    engine.startup
    repository = engine.item_repository
    @item = repository.items.find { |c| c.id == 1 }
  end


  def test_items_have_the_correct_attributes
    data = {
      id: 1,
      name: "Leatherman",
      description: "Pocket knife",
      unit_price: 7000,
      merchant_id: 102,
      created_at: "2012-03-27 14:54:09 UTC",
      updated_at: "2012-03-27 14:54:09 UTC",
    }
    item = Item.new(data, nil)
    assert item.name
  end

  def test_invoice_item
    assert_equal 3, @item.invoice_items.size
  end

  def test_merchant
    assert_equal "Schroeder-Jerde", @item.merchant.name
  end

  # def test_revenue
  #   assert_equal 3948, @item.revenue
  # end
end
