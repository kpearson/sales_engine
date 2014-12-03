require_relative 'test_helper'
require_relative '../lib/csv_parser'

class CSVParserTest < Minitest::Test
  def sees_data_file
    file = "~/turing/projects/sales_engine/test/fixtures/customers.csv_parser"
    assert get_file_path(file)
  end

  def convert_to_csv_object
    assert
  end
end