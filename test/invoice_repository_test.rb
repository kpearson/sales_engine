require_relative 'test_helper'
require_relative '../lib/invoice_repository'


class InvoiceRepositoryTest < Minitest::Test
  include Fixture
  def setup
    engine = SalesEngine.new(Fixture.data)
    engine.startup
    @invoices = engine.invoice_repository
  end

  def test_invoice_repository_has_correct_attributes
    assert @invoices
  end

  def test_invoice_repository_all
    assert_equal 300, @invoices.all.count
  end

  def test_invoice_repository_random
    invoice_repository_1 = @invoices.random
    invoice_repository_2 = @invoices.random
    refute_equal invoice_repository_1, invoice_repository_2
  end

  def test_invoice_find_by_id
    invoice = @invoices.find_by_id(1)
    assert_equal 1, invoice.id
  end

  def test_invoice_find_all_by_customer_id
    invoices = @invoices.find_all_by_customer_id(1)
    assert_equal 8, invoices.count
  end

  def test_invoice_find_all_by_merchant_id
    invoice = @invoices.find_all_by_merchant_id(27)
    assert_equal 7, invoice.count
  end

  def test_invoice_find_all_by_status
    invoice = @invoices.find_all_by_status("shipped")
    assert_equal 300, invoice.count
  end

  def test_invoice_find_by_status
    invoice = @invoices.find_by_status("cool")
    assert_equal nil, invoice
  end
end
