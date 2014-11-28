require 'csv'
require_relative 'invoice_item'

class InvoiceItemRepository
  attr_reader :invoice_items

  def initialize(file_name)
    @invoice_items = invoice_item_data(file_name)
  end

  def invoice_item_data(file_name)
    csv = CSV.open("#{file_name}",
          headers: true, header_converters: :symbol)
    csv.map do |row|
      InvoiceItem.new(row)
    end
  end

  def inspect
    "#<\#{self.class} \#{@invoice_items.size} rows>"
  end

  def all
    invoice_items
  end

  def find_by_id(id)
    invoice_items.find do |invoice_item|
      invoice_item.id == id
    end
  end

  def find_by_item_id(id)
    invoice_items.find do |invoice_item|
      invoice_item.item_id == id
    end
  end

  def find_by_invoice_id(id)
    invoice_items.find do |invoice_item|
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