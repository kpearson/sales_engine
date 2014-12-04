require_relative 'test_helper'
require_relative '../lib/merchant'

class MerchantTest < Minitest::Test
  def setup
    engine = SalesEngine.new(Fixture.data)
    engine.startup
    @repository = engine.merchant_repository
    @merchant = @repository.merchants.find { |c| c.id == 27 }
    @date = Date.parse "Wed, 07 Mar 2012"
  end

  def test_merchants_have_the_correct_attributes
    data = {
      id: 1,
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
    merchant = @repository.merchants.find { |c| c.id == 1 }
    assert_equal 15, merchant.items.count
  end

  def test_merchant_finds_its_invoices
    assert_equal 7, @merchant.invoices.count
  end

  def test_merchant_revenue_on_date
    price = @merchant.revenue(@date)
    assert_equal "$28778.59", sprintf( "$%.02f" , price )
  end

  def test_total_revenue
    price = @merchant.total_revenue
    assert_equal "$37322.53", sprintf( "$%.02f" , price )
  end

  def test_date_revenue
    price = @merchant.date_revenue(@date)
    assert_equal "$28778.59", sprintf( "$%.02f" , price )
  end

  def test_invoices_form_date
    assert_equal 2, @merchant.invoices_from_date(@date).size
  end

  def test_favorit_customer
    assert_equal "Braun", @merchant.favorite_customer.last_name
  end
end
