require_relative 'test_helper'
require_relative '../lib/item'

class TransactionTest < Minitest::Test
    data = {
            :id,
            :invoice:id,
            :credit_card_number,
            :credit_card_expiration_date,
            :result,
            :created_at,
            :updated_at
            }
    def initialize(data)
      @id         = data[:id]
      @first_name = data[:first_name]
      @last_name  = data[:last_name]
      @created_at = data[:created_at]
      @updated_at = data[:updated_at]
    end
end
