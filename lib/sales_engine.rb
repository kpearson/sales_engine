require_relative 'customer_repository'

class SalesEngine
  def startup(data=nil)
    load(data)
  end

  def load(data=nil)
    @customers     = CustomerRepository.new(data=prod_data[:customers_data])
    @items         = ItemRepository.new(data=prod_data[:items_data])
    # @merchants     = Merchant.new(data=prod_data[:merchant_data])
    # @invoice_items = InvoiceItem.new(data=prod_data[:invoice_items_data])
    # @invoice       = Invoice.new(data=prod_data[:invoice_data])
    # @transactions  = Transaction.new(data=prod_data[:transactions_data])
  end

  def customer_repository
    @customers
  end

  def get_file_path(file_name)
    path_to_file = File.expand_path("../data", __dir__)
    file_path = File.join(path_to_file, file_name)
  end

  def prod_data
    {
    :customers_data    => "data/customers.csv",
    :items_data        => "data/items.csv",
    :merchant_data     => "data/merchants.csv",
    :invoice_item_data => "data/invoice_items.csv",
    :invoice_data      => "data/invoices.csv",
    :transaction_data  => "data/transactions.csv"
    }
  end
end
