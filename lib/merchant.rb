class Merchant
  attr_reader :id,
              :name,
              :created_at,
              :updated_at,
              :repository

  def initialize(data, repository)
    @id         = data[:id].to_i
    @name       = data[:name]
    @created_at = Date.parse data[:created_at]
    @updated_at = Date.parse data[:updated_at]
    @repository = repository
  end

  def items
    repository.items(id)
  end

  def invoices
    repository.invoices(id)
  end

  def successful_invoices
    invoices.find_all {|invoice| invoice.successful_transaction?}
  end

  def revenue(date=nil)
    date.nil? ? total_revenue : date_revenue(date)
  end

  def date_revenue(date)
    invoices_from_date(date).inject(0) { |sum, invoice| sum + invoice.revenue }
  end

  def total_revenue
    successful_invoices.inject(0) { |sum, invoice| sum + invoice.revenue }
  end

  def invoices_from_date(date)
    successful_invoices.find_all do |invoice|
      invoice.created_at == date || invoice.updated_at == date
    end
  end
end