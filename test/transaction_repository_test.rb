require_relative "test_helper"
require_relative '../lib/transaction_repository'

class TransactionRepositoryTest < Minitest::Test
  include Fixture
  def setup
    engine = SalesEngine.new(Fixture.data)
    engine.startup
    @transaction_repository = engine.transaction_repository
  end

  def test_transactions_repo_can_load
    assert @transaction_repository
  end

  def test_can_find_all_transactions
    assert_equal 16, @transaction_repository.all.count
  end

  def test_transactions_find_by_id
    transaction_1 = @transaction_repository.find_by_id(1)
    assert_equal 1, transaction_1.id
    assert_equal "4654405418249632", transaction_1.credit_card_number
  end

  def test_find_all_by_invoice_id
    transactions = @transaction_repository.find_all_by_invoice(12)
    assert_equal 3, transactions.size
  end

  def test_find_by_credit_card_number
    card_number = "4654405418249632"
    transaction_1 = @transaction_repository.
                    find_by_credit_card_number(card_number)
    assert_equal card_number, transaction_1.credit_card_number
  end

  def test_find_by_result
    successful_transactions = @transaction_repository.
                              find_by_transaction_success
    assert_equal 12, successful_transactions.count
  end
end
