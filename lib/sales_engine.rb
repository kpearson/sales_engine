require 'bigdecimal'
require 'date'
require_relative 'data'
# require_relative 'date_handler'
require_relative 'item_repository'
require_relative 'invoice_repository'
require_relative 'customer_repository'
require_relative 'merchant_repository'
require_relative 'invoice_item_repository'
require_relative 'transaction_repository'

class SalesEngine
  include Production

  attr_reader :data,
              :item_repository,
              :invoice_repository,
              :merchant_repository,
              :customer_repository,
              :transaction_repository,
              :invoice_item_repository

  def initialize(data=Production.data)
    @data = data
  end

  def startup
    load
  end

  def load
    @item_repository         = ItemRepository.new(Production.
                              CSVHandeler("#{data}/items.csv"), self)
    @invoice_repository      = InvoicesRepository.new(Production.
                              CSVHandeler("#{data}/invoices.csv"), self)
    @merchant_repository     = MerchantRepository.new(Production.
                              CSVHandeler("#{data}/merchants.csv"), self)
    @customer_repository     = CustomerRepository.new(Production.
                              CSVHandeler("#{data}/customers.csv"), self)
    @transaction_repository  = TransactionRepository.new(Production.
                              CSVHandeler("#{data}/transactions.csv"), self)
    @invoice_item_repository = InvoiceItemRepository.new(Production.
                              CSVHandeler("#{data}/invoice_items.csv"), self)
  end


  def customer_invoices(customer_id)
   invoice_repository.find_all_by_customer_id(customer_id)
  end

  def merchant_items(merchant_id)
    item_repository.find_all_by_merchant_id(merchant_id)
  end

  def merchant_invoices(merchant_id)
    invoice_repository.find_all_by_merchant_id(merchant_id)
  end

  def invoice_transactions(invoice_id)
    transaction_repository.find_all_by_invoice(invoice_id)
  end

  def invoice_items_belonging_to_invoice(invoice_id)
    invoice_item_repository.find_all_by_invoice(invoice_id)
  end

  def invoice_items_belonging_to_item(item_id)
    invoice_item_repository.find_all_by_item(item_id)
  end

  def merchants(merchant_id)
    merchant_repository.find_by_id(merchant_id)
  end

  def invoice_find_item(item_id)
    item_repository.find_by_id(item_id)
  end

  def invoice_by(invoice_id)
    invoice_repository.find_by_id(invoice_id)
  end

  def customer_by(customer_id)
    customer_repository.find_by_id(customer_id)
  end

  def find_item_by(item_id)
    item_repository.find_by_id(item_id)
  end

  # def CSVHandeler(file_name)
  #   hash = CSV.read(file_name, headers: true, header_converters: :symbol)
  # end
end
