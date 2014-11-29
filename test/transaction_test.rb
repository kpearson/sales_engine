require_relative 'test_helper'
require_relative '../lib/transaction'

class TransactionTest < Minitest::Test
  def test_transactions_has_correct_attributes
    data = {
            :id => "1",
            :invoice_id => "1",
            :credit_card_number => "4654405418249632",
            :credit_card_expiration_date => "2014-03-30",
            :result => "success",
            :created_at => "2012-03-27 14:54:09 UTC",
            :updated_at => "2012-03-27 14:54:09 UTC"
            }
     transaction = Transaction.new(data)
     assert transaction.id
     assert transaction.invoice_id
     assert transaction.credit_card_number
     assert transaction.credit_card_expiration_date
     assert transaction.result
     assert transaction.created_at
     assert transaction.updated_at
   end
end
