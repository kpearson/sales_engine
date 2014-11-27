require_relative 'customer_repository'

class SalesEngine
  def startup(data=dataish)
    load(data)
  end

  def load(data)
    customers = CustomerRepository.new(data)
    @customers = customers
    # Items.new("../data/fill_in.csv")
    # Merchant.new("../data/fill_in.csv")
    # InvoiceItem.new("../data/fill_in.csv")
    # Invoice.new("../data/fill_in.csv")
    # Transaction.new("../data/fill_in.csv")
  end

  def customer_repository
    @customers
  end

  def get_file_path(file_name)
    path_to_file = File.expand_path("../data", __dir__)
    file_path = File.join(path_to_file, file_name)
  end

  def dataish
    customers_data = "data/customers.csv"
  end
end
