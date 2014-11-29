require_relative 'test_helper'
require_relative '../lib/invoices_repository'


class InvoiceRepositoryTest < Minitest::Test
  def setup
    @invoices = InvoicesRepository.new("./test/fixtures/invoices.csv")
  end

  def test_invoice_repository_has_correct_attributes
    assert @invoices
  end

  def test_invoice_find_by_id
    invoice = @invoices.find_by_id("1")
    assert_equal "1", invoice.id
  end

  def test_invoice_find_by_customer_id
    invoice = @invoices.find_by_customer_id("1")
    assert_equal "1", invoice.customer_id
  end

  def test_invoice_find_by_merchant_id
    invoice = @invoices.find_by_merchant_id("26")
    assert_equal "26", invoice.merchant_id
  end

  def test_invoice_find_all_by_status
    invoice = @invoices.find_by_status("shipped")
    assert_equal 16, invoice.count
  end
end
