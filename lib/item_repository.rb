require 'csv'
require_relative 'item'

class ItemRepository
  attr_reader :items

  def initialize(file_name)
    @items = item_data(file_name)
  end

  def item_data(file_path)
    csv = CSV.open("#{file_path}",
          headers: true, header_converters: :symbol)
    csv.map do |row|
      Item.new(row)
    end
  end

  def inspect
    "#<\#{self.class} \#{@items.size} rows>"
  end

  def all
    items
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

  def find_by_description(description)
    items.find do |item|
      item.description == description
    end
  end
end