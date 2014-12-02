require_relative 'test_helper'
require_relative '../lib/invoice'

class InvoiceTest < Minitest::Test
  def test_invoices_have_correct_attributes
    data = {
            :id =>"1",
            :customer_id =>"1",
            :merchant_id => "26",
            :status => "shipped",
            :created_at =>"2012-03-25 09:54:09 UTC",
            :updated_at =>"2012-03-25 09:54:09 UTC"
           }
    invoices = Invoice.new(data, nil)
    assert invoices.id
    assert invoices.customer_id
    assert invoices.merchant_id
    assert invoices.status
    assert invoices.created_at
    assert invoices.updated_at
  end
end
