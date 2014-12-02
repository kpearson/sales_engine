class Merchant
  attr_reader :id,
              :name,
              :created_at,
              :updated_at

  def initialize(data, repository)
    @id         = data[:id]
    @name       = data[:name]
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
    @repository = repository
  end

  def items
    @repository.items(id)
  end

  def invoices
    @repository.invoices(id)
  end
end