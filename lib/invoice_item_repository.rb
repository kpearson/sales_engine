require 'csv'
require_relative 'invoice_item'

class InvoiceItemRepository
  attr_reader :invoice_items

  def initialize(file_name, parent)
    @invoice_items = invoice_item_data(file_name)
    @engine        = parent
  end

  def invoice_item_data(data)
    data.map do |row|
      InvoiceItem.new(row, self)
    end
  end

  def inspect
    "<#{self.class} #{@invoice_items.size} rows>"
  end

  def all
    invoice_items
  end

  def find_by_id(id)
    invoice_items.find do |invoice_item|
      invoice_item.id == id
    end
  end

  def find_all_by_item(id)
    invoice_items.find_all do |invoice_item|
      invoice_item.item_id == id
    end
  end

  def find_all_by_invoice(id)
    invoice_items.find_all do |invoice_item|
      invoice_item.invoice_id == id
    end
  end

  def find_by_quantity(quantity)
    invoice_items.find do |invoice_item|
      invoice_item.quantity == quantity
    end
  end

  def find_by_price(price)
    invoice_items.find do |invoice_item|
      invoice_item.unit_price == price
    end
  end
end
    # csv = CSV.open("#{file_name}",
    #       headers: true, header_converters: :symbol)