require_relative 'test_helper'
require_relative '../lib/invoice'

class InvoiceTest < Minitest::Test
  def setup
    engine = SalesEngine.new(Fixture.data)
    engine.startup
    repository = engine.invoice_repository
    @invoice = repository.invoices.find { |c| c.id == 12 }
  end

  def test_invoices_have_correct_attributes
    data = {
      :id => 1,
      :customer_id => 1,
      :merchant_id => 26,
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

  def test_invoice_finds_its_transactions
    assert_equal 3, @invoice.transactions.size
  end

  def test_invoice_finds_invoice_items
    assert_equal 0, @invoice.invoice_items.count
  end

  def test_invoice_finds_total_item_quantity
    assert_equal 0, @invoice.total_item_quantity
  end

  def test_successful_transaction?
    assert @invoice.successful_transaction?
  end

  def test_invoice_finds_customer_by_id
    assert_equal 3, @invoice.customer.id
  end
end
