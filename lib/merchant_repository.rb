require 'csv'
require_relative 'merchant'

class MerchantRepository
  attr_reader :merchant

  def initialize(file_name)
    @merchants = merchant_data(file_name)
  end

  def merchant_data(file_path)
    csv = CSV.open("#{file_path}",
        headers: true, header_converters: :symbol)
    csv.map do |row|
    Merchant.new(row)
  end
end

  def all
    merchant
  end

  def find_by_id(id)
    merchant.find do |merchant|
      merchant.id == merchant
    end
  end

  def find_by_name(name)
    merchant.find do |merchant|
      merchant.name == name
    end
  end

  def find_by_description(description)
      merchant.find do |merchant|
        merchant.description = description
      end
  end
#check this is correct: are these the appropriate methods?