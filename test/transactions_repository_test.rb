require_relative "test_helper"
require_relative '../lib/transactions_repository'

class TransactionsRepositoryTest < Minitest::Test
  def setup
    test_data ="./test/fixtures/transactions.csv"
    prod_data ="./data/transactions.csv"
    @transactions_repository = TransactionsRepository.new(test_data)
  end

  def test_transactions_repo_can_load
    assert @transactions_repository
  end

  def test_can_find_all_transactions
    assert_equal 16, @transactions_repository.all.count
  end

  def test_transactions_find_by_id
    transaction_1 = @transactions_repository.find_by_id("1")
    assert_equal "1", transaction_1.id
    assert_equal "4654405418249632", transaction_1.credit_card_number
  end

  def test_find_by_invoice_id
    transaction_1 = @transactions_repository.find_by_invoice_id("1")
    assert_equal "1", transaction_1.invoice_id
    assert_equal "4654405418249632", transaction_1.credit_card_number
  end

  def test_find_by_credit_card_number
    card_number = "4654405418249632"
    transaction_1 = @transactions_repository.
                    find_by_credit_card_number(card_number)
    assert_equal card_number, transaction_1.credit_card_number
  end

  def test_find_by_result
    successful_transactions = @transactions_repository.
                              find_by_transaction_success
    assert_equal 12, successful_transactions.count
  end
end
