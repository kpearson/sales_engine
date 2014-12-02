require_relative 'item_repository'
require_relative 'invoices_repository'
require_relative 'customer_repository'
require_relative 'merchant_repository'
require_relative 'invoice_item_repository'
require_relative 'transactions_repository'

class SalesEngine
  def startup(data=prod_data)
    load(data)
  end

  def load(data)
    @items         = ItemRepository.new(data[:items_data])
    @invoices      = InvoicesRepository.new(data[:invoices_data])
    @merchants     = MerchantRepository.new(data[:merchants_data])
    @customers     = CustomerRepository.new(data[:customers_data], self)
    @transactions  = TransactionsRepository.new(data[:transactions_data])
    @invoice_items = InvoiceItemRepository.new(data[:invoice_items_data])
  end
  attr_reader :items,
              :invoices,
              :merchants,
              :customers,
              :transactions,
              :invoice_items

  def get_file_path(file_name)
    path_to_file = File.expand_path("../data", __dir__)
    file_path = File.join(path_to_file, file_name)
  end

  def customer_invoices(id)
   invoices.find_all_by_customer_id(id)
  end

  def prod_data
    {
    :items_data         => "data/items.csv",
    :invoices_data      => "data/invoices.csv",
    :customers_data     => "data/customers.csv",
    :merchants_data     => "data/merchants.csv",
    :transactions_data  => "data/transactions.csv",
    :invoice_items_data => "data/invoice_items.csv"
    }
  end
end
