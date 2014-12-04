class Invoice
  attr_reader :id,
              :customer_id,
              :merchant_id,
              :status,
              :created_at,
              :updated_at,
              :repository

  def initialize(data, repository)
    @id           = data[:id].to_i
    @customer_id  = data[:customer_id].to_i
    @merchant_id  = data[:merchant_id].to_i
    @status       = data[:status]
    @created_at   = Date.parse data[:created_at]
    @updated_at   = Date.parse data[:updated_at]
    @repository   = repository
  end

  def transactions
    repository.transactions(id)
  end

  def customer
    repository.find_customer_by(customer_id)
  end

  def invoice_items
    repository.invoice_items(id)
  end

  def items
    invoice_items.map { |invoice_item| invoice_item.item }
  end

  def total_item_quantity
    items.inject(0) { |sum, item| sum + item.quantity}
  end

  def successful_transaction?
    transactions.select { |transaction| transaction.successful_transaction? }
  end

  def revenue
    invoice_items.inject(0) do |sum, invoice_item|
      sum + invoice_item.item_revenue
    end
  end
end