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
    @created_at   = data[:created_at]
    @updated_at   = data[:updated_at]
    @repository = repository
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

  def total_item_quantity
    invoice_items.inject(0) { |sum, item| total + item.quantity}
  end

  def successful_transaction?
    transactions.any? { |transaction| transaction.successful_transaction? }
  end
end