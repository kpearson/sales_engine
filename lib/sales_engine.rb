require_relative 'customer_repository'
require_relative 'item_repository'
require_relative 'invoice_item_repository'

class SalesEngine
  def startup(data=prod_data)
    load(data)
  end

  def load(data)
    @customers     = CustomerRepository.new(data[:customers_data])
    @items         = ItemRepository.new(data[:items_data])
    # @merchants     = Merchant.new(data[:merchant_data])
    @invoice_items = InvoiceItemRepository.new(data[:invoice_items_data])
    # @invoice       = Invoice.new(data[:invoice_data])
    # @transactions  = Transaction.new(data[:transactions_data])
  end
  attr_reader :customers, :items, :invoice_items

  def get_file_path(file_name)
    path_to_file = File.expand_path("../data", __dir__)
    file_path = File.join(path_to_file, file_name)
  end

  def prod_data
    {
    :customers_data     => "data/customers.csv",
    :items_data         => "data/items.csv",
    :merchant_data      => "data/merchants.csv",
    :invoice_items_data => "data/invoice_items.csv",
    :invoice_data       => "data/invoices.csv",
    :transaction_data   => "data/transactions.csv"
    }
  end
end
