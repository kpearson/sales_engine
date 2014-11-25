class CustomerManager
  attr_reader :data
  def initialize(data)
    @data = CustomerData.new
  end

  def load
    true
  end

  def all
    data.all
  end

  def find_by(attribute, match)
    @data.find_by
  end
end