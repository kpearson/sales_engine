class Item
  # include DateHandler
  attr_reader :id,
              :name,
              :description,
              :unit_price,
              :merchant_id,
              :created_at,
              :updated_at

  def initialize(data, repository)
    @id          = data[:id].to_i
    @name        = data[:name]
    @description = data[:description]
    @unit_price  = price_converter(data[:unit_price])
    @merchant_id = data[:merchant_id].to_i
    @created_at  = data[:created_at]
    @updated_at  = data[:updated_at]
    @repository = repository
  end

  def price_converter(unit_price)
    price = BigDecimal.new(unit_price)/100
    sprintf( "$%.02f" , price )
  end
end