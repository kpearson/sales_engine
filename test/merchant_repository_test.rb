require 'test_helper'
require_relative '../lib/merchant_repository'

class MerchantRepositoryTest < Minitest::Test
  # include Fixture
  def setup
    engine = SalesEngine.new(Fixture.data)
    engine.startup
    @merchant_repository = engine.merchant_repository
  end

  def test_merchant_repository
    assert @merchant_repository
  end

  def test_all_merchants
    assert_equal 100, @merchant_repository.all.count
  end

  def test_merchants_find_by_id
    merchant_1 = @merchant_repository.find_by_id(1)
    assert_equal 1, merchant_1.id
  end

  def test_merchants_find_by_name
    merchant_1 = @merchant_repository.find_by_name("Schroeder-Jerde")
    assert_equal "Schroeder-Jerde", merchant_1.name
  end
end