class InvoiceItem
  attr_reader :id,
              :item_id,
              :invoice_id,
              :quantity,
              :unit_price,
              :created_at,
              :updated_at,
              :repository

  def initialize(data, repository)
    @id         = data[:id].to_i
    @item_id    = data[:item_id].to_i
    @invoice_id = data[:invoice_id].to_i
    @quantity   = data[:quantity].to_i
    @unit_price = price_converter(data[:unit_price])
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
    @repository = repository
  end

  def price_converter(unit_price)
    price = BigDecimal.new(unit_price)/100
  end

  def item
    repository.find_item_by(item_id)
  end

  def invoice
    repository.find_invoice_by(invoice_id)
  end

  def item_revenue
    BigDecimal.new(quantity * unit_price)
  end
end