require_relative 'test_helper'
require_relative '../lib/csv_parser'

class CSVParserTest < Minitest::Test
  def test_sees_data_file
    skip
    file = "~/turing/projects/sales_engine/test/fixtures/customers.csv_parser"
    assert get_file_path(file)
  end

  def test_convert_to_csv_object
    skip
    assert
  end
end