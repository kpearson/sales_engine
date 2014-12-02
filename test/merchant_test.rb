require_relative 'test_helper'
require_relative '../lib/merchant'

class MerchantTest < Minitest::Test
  def setup
    engine = SalesEngine.new
    engine.startup(Fixture::DATA)
    @repository = engine.merchants_repository
    @merchant = @repository.merchants.find { |c| c.id == "1" }
  end

  def test_merchants_have_the_correct_attributes
    data = {
      id: "1",
      name: "Schroeder-Jerde",
      created_at: "2012-03-27 14:53:59 UTC",
      updated_at: "2012-03-27 14:53:59 UTC",
    }
    merchant = Merchant.new(data, nil)
    assert merchant.respond_to? :id
    assert merchant.respond_to? :name
    assert merchant.respond_to? :created_at
    assert merchant.respond_to? :updated_at
  end

  def test_merchant_finds_its_items
    assert_equal 15, @merchant.items.count
  end

  def test_merchant_finds_its_invoices
    merchant_27 = @repository.merchants.find { |c| c.id == "27" }
    assert_equal 2, merchant_27.invoices.count
  end
end
