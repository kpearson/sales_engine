require_relative 'data'
require_relative 'item_repository'
require_relative 'invoices_repository'
require_relative 'customer_repository'
require_relative 'merchant_repository'
require_relative 'invoice_item_repository'
require_relative 'transactions_repository'

class SalesEngine
  include Production
  def startup(data=Production::DATA)
    load(data)
  end

  def load(data)
    @items_repository         = ItemRepository.new(
                                  data[:items_data], self)
    @invoices_repository      = InvoicesRepository.new(
                                  data[:invoices_data], self)
    @merchants_repository     = MerchantRepository.new(
                                  data[:merchants_data], self)
    @customers_repository     = CustomerRepository.new(
                                  data[:customers_data], self)
    @transactions_repository  = TransactionsRepository.new(
                                  data[:transactions_data], self)
    @invoice_items_repository = InvoiceItemRepository.new(
                                  data[:invoice_items_data], self)
  end
  attr_reader :items_repository,
              :invoices_repository,
              :merchants_repository,
              :customers_repository,
              :transactions_repository,
              :invoice_items_repository

  def get_file_path(file_name)
    path_to_file = File.expand_path("../data", __dir__)
    file_path = File.join(path_to_file, file_name)
  end

  def customer_invoices(customer_id)
   invoices_repository.find_all_by_customer_id(customer_id)
  end

  def merchant_items(merchant_id)
    items_repository.find_all_by_merchant_id(merchant_id)
  end

  def merchant_invoices(merchant_id)
    invoices_repository.find_all_by_merchant_id(merchant_id)
  end

end
