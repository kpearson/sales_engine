require 'csv'

class CSVParser

  def get_file_path(file_name)
    path_to_file = File.expand_path("../data", __dir__)
    file_path = File.join(path_to_file, file_name)
  end

  def csv_data(file_name, klass)
    file_path = get_file_path(file_name)
    csv = CSV.open("#{file_path}",
                  headers: true, header_converters: :symbol)
    @headers = csv.first
    csv.map do |row|
      klass.new(row)
    end
  end


end