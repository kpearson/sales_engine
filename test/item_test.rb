require_relative 'test_helper'
require_relative '../lib/item'

class ItemTest < Minitest::Test
  def test_items_have_the_correct_attributes
    data = {
            id: "1",
            name: "Leatherman",
            description: "Pocket knife",
            unit_price: "70.00",
            merchant_id: "102",
            created_at: "2012-03-27 14:54:09 UTC",
            updated_at: "2012-03-27 14:54:09 UTC",
            }
    item = Item.new(data)
    assert item.name
  end
end