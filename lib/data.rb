module Production
  def self.data
    sales_engine_root = File.expand_path('../..', __FILE__)
    fixture_data = File.join sales_engine_root, 'data'
  end

  def self.CSVHandeler(file_name)
    hash = CSV.read(file_name, headers: true, header_converters: :symbol)
  end

end
