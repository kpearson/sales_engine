class Customer
  attr_reader :id,
              :first_name,
              :last_name,
              :created_at,
              :updated_at,
              :repository

  def initialize(data, repository)
    @id         = data[:id].to_i
    @first_name = data[:first_name]
    @last_name  = data[:last_name]
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
    @repository = repository
  end


  def invoices
    repository.invoices(id)
  end

  def transactions
    invoices.select { |invoice| invoice.transactions}
  end

  def successful_transactions
    transactions.select { |transaction| transaction.successful_transaction?}
  end

  def favorite_merchant
    t = successful_transactions.map { |transaction| transaction.merchant_id }
    x = t.map.max { |n| t.count(n) }
    repository.engine.merchant_repository.find_by_id(x)
  end
end