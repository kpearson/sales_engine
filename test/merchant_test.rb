require_relative 'test_helper'
require_relative '../lib/merchant'

class MerchantTest < Minitest::Test

  def test_merchants_have_the_correct_attributes
    data = {
            id: "1",
            name: "Schroeder-Jerde",
            created_at: "2012-03-27 14:53:59 UTC",
            updated_at: "2012-03-27 14:53:59 UTC",
            }
    merchant = Merchant.new(data)
    assert_equal "Schroeder-Jerde", merchant.name
  end

end
