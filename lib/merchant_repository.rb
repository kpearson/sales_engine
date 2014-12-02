require 'csv'
require_relative 'merchant'

class MerchantRepository
  attr_reader :merchants

  def initialize(file_name, parent)
    @merchants = merchant_data(file_name)
    @engine    = parent
  end

  def merchant_data(file_path)
    csv = CSV.open("#{file_path}",
        headers: true, header_converters: :symbol)
    csv.map do |row|
    Merchant.new(row, self)
    end
  end

  def inspect
    "<#{self.class} #{@merchants.size} rows>"
  end

  def all
    merchants
  end

  def find_by_id(id)
    merchants.find do |merchant|
      merchant.id == id
    end
  end

  def find_by_name(name)
    merchants.find do |merchant|
      merchant.name == name
    end
  end

  def items(merchant_id)
    @engine.merchant_items(merchant_id)
  end

  def invoices(merchant_id)
    @engine.merchant_invoices(merchant_id)
  end
end