require 'csv'
require_relative 'merchant'

class MerchantRepository
  attr_reader :merchants, :engine

  def initialize(data, parent)
    @merchants = merchant_data(data)
    @engine    = parent
  end

  def merchant_data(data)
    data.map do |row|
    Merchant.new(row, self)
    end
  end

  def inspect
    "<#{self.class} #{@merchants.size} rows>"
  end

  def all
    merchants
  end

  def random
    merchants.sample
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

  def find_all_by_name(name)
    merchants.find_all do |merchant|
      merchant.name == name
    end
  end

  def items(merchant_id)
    engine.merchant_items(merchant_id)
  end

  def invoices(merchant_id)
    engine.merchant_invoices(merchant_id)
  end

  def revenue(date)
    all.inject(BigDecimal.new(0)) {|sum, merchant| sum + merchant.revenue(date)}
  end

  def most_items(num)
    all.sort_by {|merchant| merchant.items_sold}.reverse.take(num)
  end
end
