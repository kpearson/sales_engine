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

end