require 'csv'
require_relative 'item'

class ItemRepository
  attr_reader :items

  def initialize(data, parent)
    @items     = item_data(data)
    @engine    = parent
  end

  def item_data(data)
    data.map do |row|
      Item.new(row, self)
    end
  end

  def inspect
    "<#{self.class} #{@items.size} rows>"
  end

  def all
    items
  end

  def random
    items.sample
  end

  def find_by_id(id)
    items.find do |item|
      item.id == id
    end
  end

  def find_by_name(name)
    items.find do |item|
      item.name == name
    end
  end

  def find_by_unit_price(price)
    items.find do |item|
      item.unit_price == price
    end
  end

  def find_by_description(description)
    items.find do |item|
      item.description == description
    end
  end

  def find_all_by_merchant_id(merchant_id)
    items.find_all do |item|
      item.merchant_id == merchant_id
    end
  end
end