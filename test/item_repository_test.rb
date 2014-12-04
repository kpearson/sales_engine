require_relative 'test_helper'
require_relative '../lib/item_repository'

class ItemRepositoryTest < Minitest::Test
  include Fixture
  def setup
    engine = SalesEngine.new(Fixture.data)
    engine.startup
    @item_repository = engine.item_repository
  end

  def test_items_repo_can_load
    assert @item_repository
  end

  def test_items_all
    assert_equal 200, @item_repository.all.count
  end

  def test_items_random
    item_1 = @item_repository.random
    item_2 = @item_repository.random
    refute_equal item_1.id, item_2.id
  end

  def test_items_find_by_id
    item_1 = @item_repository.find_by_id(1)
    assert_equal 1, item_1.id
    assert_equal "Item Qui Esse", item_1.name
  end

  def test_items_find_by_name
    item_1 = @item_repository.find_by_name("Item Ea Voluptatum")
    assert_equal 3, item_1.id
  end

  def test_find_all_by_name
    items = @item_repository.find_all_by_name("Item Ea Voluptatum")
    assert_equal 1, items.size
  end

  def test_items_find_by_unit_price
    item = @item_repository.find_by_unit_price BigDecimal.new("751.07")
    assert_equal 1, item.id
  end

  def test_find_by_description
    description = "Fuga assumenda occaecati hic dolorem tenetur dolores nisi. Est tenetur adipisci voluptatem vel. Culpa adipisci consequatur illo. Necessitatibus quis quo velit sed repellendus ut amet."
    item_7 = @item_repository.find_by_description(description)
    assert_equal description, item_7.description
    assert_equal 7, item_7.id
  end
end